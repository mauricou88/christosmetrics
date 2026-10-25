package com.christosmetrics.web.controller;

import com.christosmetrics.application.dto.PassationDtos.*;
import com.christosmetrics.application.dto.ResultatDto;
import com.christosmetrics.application.service.PassationApplicationService;
import com.christosmetrics.domain.model.User;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

/**
 * Endpoints du cycle de vie d'une passation (protégés par JWT).
 *
 *  POST /api/passations/demarrer?code=amour
 *        → démarre ou REPREND la passation ; renvoie la progression
 *          (dont l'index de la prochaine question sans réponse).
 *
 *  POST /api/passations/{id}/repondre        (body: {questionId, valeur})
 *  POST /api/passations/{id}/repondre-lot     (body: {reponses:[...]})
 *        → enregistre une/des réponse(s) ; renvoie la progression mise à jour.
 *
 *  POST /api/passations/{id}/terminer
 *        → fige la passation, calcule et renvoie le résultat.
 *
 *  GET  /api/passations/{id}/resultat
 *        → relit un résultat déjà calculé.
 *
 * L'utilisateur courant est injecté par Spring Security (@AuthenticationPrincipal)
 * grâce au JwtAuthFilter : chaque appel est donc rattaché au bon compte, ce qui
 * garantit la reprise de SA progression et empêche d'accéder à celle d'autrui.
 */
@RestController
@RequestMapping("/api/passations")
public class PassationController {

    private final PassationApplicationService service;

    public PassationController(PassationApplicationService service) {
        this.service = service;
    }

    @PostMapping("/demarrer")
    public ProgressionDto demarrer(@AuthenticationPrincipal User user,
                                   @RequestParam String code) {
        return service.demarrerOuReprendre(user, code);
    }

    @PostMapping("/{id}/repondre")
    public ProgressionDto repondre(@AuthenticationPrincipal User user,
                                   @PathVariable Long id,
                                   @RequestBody RepondreRequest req) {
        return service.repondre(user, id, req);
    }

    @PostMapping("/{id}/repondre-lot")
    public ProgressionDto repondreLot(@AuthenticationPrincipal User user,
                                      @PathVariable Long id,
                                      @RequestBody RepondreLotRequest req) {
        return service.repondreLot(user, id, req);
    }

    @PostMapping("/{id}/terminer")
    public ResultatDto terminer(@AuthenticationPrincipal User user,
                                @PathVariable Long id) {
        return service.terminerEtCalculer(user, id);
    }

    @GetMapping("/{id}/resultat")
    public ResultatDto resultat(@AuthenticationPrincipal User user,
                                @PathVariable Long id) {
        return service.resultat(user, id);
    }
}
