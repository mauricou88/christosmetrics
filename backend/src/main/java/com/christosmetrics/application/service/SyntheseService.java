package com.christosmetrics.application.service;

import com.christosmetrics.application.dto.HistoriqueDtos.*;
import com.christosmetrics.domain.model.*;
import com.christosmetrics.domain.repository.*;
import com.christosmetrics.domain.service.ScoringService;
import com.christosmetrics.application.i18n.ContenuLocalise;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.stream.Collectors;

/**
 * Historique de l'utilisateur + synthèse CHRISTOS globale.
 * complet = toutes les passations INDIVIDUELLES actives sont TERMINEES ;
 * scoreGlobal (si complet) = moyenne non pondérée des scores individuels.
 */
@Service
public class SyntheseService {

    private final PassationRepository passationRepo;
    private final ReferentielRepository referentielRepo;
    private final RestitutionPdfRepository pdfRepo;
    private final ScoringService scoringService;

    public SyntheseService(PassationRepository passationRepo,
                           ReferentielRepository referentielRepo,
                           RestitutionPdfRepository pdfRepo,
                           ScoringService scoringService) {
        this.passationRepo = passationRepo;
        this.referentielRepo = referentielRepo;
        this.pdfRepo = pdfRepo;
        this.scoringService = scoringService;
    }

    @Transactional(readOnly = true)
    public SyntheseGlobale synthese(User user) {
        return synthese(user, "fr");
    }

    /** Localise les noms de l'historique sans changer la selection des passations. */
    @Transactional(readOnly = true)
    public SyntheseGlobale synthese(User user, String langue) {
        List<Passation> toutes = passationRepo.findByUserOrderByDebuteeLeDesc(user);

        // Une entrée par référentiel : TERMINEE > EN_COURS, puis plus récente.
        Map<Long, Passation> parRef = new LinkedHashMap<>();
        for (Passation p : toutes) {
            Long k = p.getReferentiel().getId();
            Passation c = parRef.get(k);
            if (c == null || meilleure(p, c)) parRef.put(k, p);
        }

        List<PassationResume> resumes = parRef.values().stream()
                .map(p -> toResume(p, langue)).collect(Collectors.toList());

        List<Referentiel> indivActifs = referentielRepo.findByActifTrue().stream()
                .filter(r -> r.getType() == Referentiel.Type.INDIVIDUEL)
                .toList();

        List<Passation> termineesIndiv = parRef.values().stream()
                .filter(p -> p.getReferentiel().getType() == Referentiel.Type.INDIVIDUEL)
                .filter(Passation::estTerminee).toList();

        int attendus = indivActifs.size();
        int realises = termineesIndiv.size();
        boolean complet = attendus > 0 && realises >= attendus;

        Double scoreGlobal = null;
        Integer scoreArrondi = null;
        if (complet) {
            double somme = 0;
            for (Passation p : termineesIndiv) {
                somme += scoringService.calculer(p).global();
            }
            scoreGlobal = somme / termineesIndiv.size();
            scoreArrondi = (int) Math.round(scoreGlobal);
        }
        return new SyntheseGlobale(realises, attendus, complet, scoreGlobal, scoreArrondi, resumes);
    }

    private boolean meilleure(Passation cand, Passation cur) {
        if (cand.estTerminee() && !cur.estTerminee()) return true;
        if (!cand.estTerminee() && cur.estTerminee()) return false;
        return cand.getDebuteeLe().isAfter(cur.getDebuteeLe());
    }

    /** Conserve les dates, scores et liens PDF independants de la langue. */
    private PassationResume toResume(Passation p, String langue) {
        Double s = null; Integer sa = null;
        if (p.estTerminee()) {
            var calc = scoringService.calculer(p);
            s = calc.global(); sa = calc.globalArrondi();
        }
        boolean pdfOk = pdfRepo.findByPassation(p).isPresent();
        return new PassationResume(
                p.getId(), p.getReferentiel().getCode(), ContenuLocalise.nom(p.getReferentiel(), langue),
                p.getReferentiel().getType().name(), p.getEtat().name(),
                p.getDebuteeLe(), p.getTermineeLe(), s, sa, pdfOk);
    }
}
