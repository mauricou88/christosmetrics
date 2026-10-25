package app.christosmetrics.mobile;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.ClipData;
import android.content.ContentResolver;
import android.content.ContentUris;
import android.content.ContentValues;
import android.content.Intent;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.provider.MediaStore;
import android.util.Base64;
import androidx.activity.result.ActivityResult;
import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.ActivityCallback;
import com.getcapacitor.annotation.CapacitorPlugin;
import java.io.OutputStream;

/** Télécharge et ouvre le PDF, sans permission de stockage globale sur Android 10+. */
@CapacitorPlugin(name = "EnregistrementPdf")
public class EnregistrementPdfPlugin extends Plugin {
    @PluginMethod
    public void enregistrer(PluginCall call) {
        String base64 = call.getString("base64");
        String nomFichier = call.getString("nomFichier");
        if (base64 == null || nomFichier == null) {
            call.reject("PDF ou nom de fichier manquant.");
            return;
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            enregistrerDansTelechargements(call, nomFichier, base64);
            return;
        }
        // Sur les anciennes versions Android, laisser choisir le dossier sans permission globale.
        Intent intent = new Intent(Intent.ACTION_CREATE_DOCUMENT);
        intent.addCategory(Intent.CATEGORY_OPENABLE);
        intent.setType("application/pdf");
        intent.putExtra(Intent.EXTRA_TITLE, nomFichier);
        startActivityForResult(call, intent, "fichierChoisi");
    }

    @ActivityCallback
    private void fichierChoisi(PluginCall call, ActivityResult result) {
        if (call == null) return;
        if (result.getResultCode() != Activity.RESULT_OK || result.getData() == null) {
            call.reject("Enregistrement du PDF annulé.");
            return;
        }
        Uri uri = result.getData().getData();
        if (uri == null) {
            call.reject("Emplacement du PDF manquant.");
            return;
        }
        try (OutputStream sortie = getContext().getContentResolver().openOutputStream(uri, "w")) {
            if (sortie == null) throw new IllegalStateException("Emplacement inaccessible");
            sortie.write(Base64.decode(call.getString("base64"), Base64.DEFAULT));
        } catch (Exception erreur) {
            call.reject("Impossible d'enregistrer le PDF : " + erreur.getMessage());
            return;
        }
        ouvrirPdf(call, uri);
    }

    private void enregistrerDansTelechargements(PluginCall call, String nomFichier, String base64) {
        ContentResolver resolver = getContext().getContentResolver();
        Uri uri = null;
        boolean nouveau = false;
        try {
            String dossier = Environment.DIRECTORY_DOWNLOADS + "/";
            // Réutiliser uniquement un fichier de notre app portant exactement le même nom.
            // Cela évite les suffixes « (1) » lors d'un nouveau téléchargement.
            try (Cursor fichiers = resolver.query(
                    MediaStore.Downloads.EXTERNAL_CONTENT_URI,
                    new String[]{MediaStore.MediaColumns._ID},
                    MediaStore.MediaColumns.DISPLAY_NAME + "=? AND " +
                            MediaStore.MediaColumns.RELATIVE_PATH + "=? AND " +
                            MediaStore.MediaColumns.OWNER_PACKAGE_NAME + "=?",
                    new String[]{nomFichier, dossier, getContext().getPackageName()}, null)) {
                if (fichiers != null && fichiers.moveToFirst()) {
                    uri = ContentUris.withAppendedId(MediaStore.Downloads.EXTERNAL_CONTENT_URI, fichiers.getLong(0));
                }
            }
            ContentValues valeurs = new ContentValues();
            valeurs.put(MediaStore.MediaColumns.DISPLAY_NAME, nomFichier);
            valeurs.put(MediaStore.MediaColumns.MIME_TYPE, "application/pdf");
            valeurs.put(MediaStore.MediaColumns.RELATIVE_PATH, dossier);
            valeurs.put(MediaStore.MediaColumns.IS_PENDING, 1);
            if (uri == null) {
                uri = resolver.insert(MediaStore.Downloads.EXTERNAL_CONTENT_URI, valeurs);
                nouveau = true;
            } else {
                resolver.update(uri, valeurs, null, null);
            }
            if (uri == null) throw new IllegalStateException("Dossier Téléchargements inaccessible");
            try (OutputStream sortie = resolver.openOutputStream(uri, "wt")) {
                if (sortie == null) throw new IllegalStateException("Fichier inaccessible");
                sortie.write(Base64.decode(base64, Base64.DEFAULT));
            }
            ContentValues publie = new ContentValues();
            publie.put(MediaStore.MediaColumns.IS_PENDING, 0);
            resolver.update(uri, publie, null, null);
        } catch (Exception erreur) {
            if (uri != null) {
                try {
                    if (nouveau) resolver.delete(uri, null, null);
                    else {
                        ContentValues publie = new ContentValues();
                        publie.put(MediaStore.MediaColumns.IS_PENDING, 0);
                        resolver.update(uri, publie, null, null);
                    }
                } catch (Exception ignore) { /* Conserver la cause initiale. */ }
            }
            call.reject("Impossible d'enregistrer le PDF : " + erreur.getMessage());
            return;
        }
        ouvrirPdf(call, uri);
    }

    private void ouvrirPdf(PluginCall call, Uri uri) {
        boolean ouvert = false;
        try {
            Intent lecture = new Intent(Intent.ACTION_VIEW);
            lecture.setDataAndType(uri, "application/pdf");
            lecture.setClipData(ClipData.newRawUri("PDF CHRISTOSMETRICS", uri));
            lecture.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
            getActivity().startActivity(lecture);
            ouvert = true;
        } catch (ActivityNotFoundException | SecurityException erreur) {
            // Le PDF reste accessible dans Téléchargements même sans lecteur installé.
        }
        JSObject reponse = new JSObject();
        reponse.put("uri", uri.toString());
        reponse.put("ouvert", ouvert);
        call.resolve(reponse);
    }
}
