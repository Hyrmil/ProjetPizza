package fr.formation.projet.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fr.formation.projet.dao.LivraisonDao;
import fr.formation.projet.entities.Livraison;

@Service
public class LivraisonService {

    @Autowired
    private LivraisonDao livraisondao;
    
    @Transactional
    public List<Livraison> getLivraison() {
        
                // do some business processing here ...
            //now call DAO layer
        return livraisondao.getLivraison();

  }
    
    
    @Transactional
    public boolean addLivraison(Livraison livraison) {
        
         // do some business processing  here ...
            //now call DAO layer
        return(livraisondao.addLivraison(livraison));
        
    }
    
    @Transactional
    public Livraison getSingleLivraison(Integer theId) {
        
        // do some business processing here ... 
            //now call DAO layer
        return livraisondao.getSingleLivraison(theId);
    }
    
    
    @Transactional
    public void deleteLivraison(Integer theId) {
         // do some business processing here ...
         //now call DAO layer
    	livraisondao.deleteLivraison(theId);
    }
}