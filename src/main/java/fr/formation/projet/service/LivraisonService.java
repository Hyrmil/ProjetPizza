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
    public List<Livraison> getCustomer() {
        
                // do some business processing here ...
            //now call DAO layer
        return livraisondao.getCustomer();

  }
    
    
    @Transactional
    public boolean addCustomer(Livraison customer) {
        
         // do some business processing  here ...
            //now call DAO layer
        return(livraisondao.addCustomer(customer));
        
    }
    
    @Transactional
    public Livraison getSingleCustomer(int theId) {
        
        // do some business processing here ... 
            //now call DAO layer
        return livraisondao.getSingleCustomer(theId);
    }
    
    
    @Transactional
    public void deleteCustomer(int theId) {
         // do some business processing here ...
         //now call DAO layer
    	livraisondao.deleteCustomer(theId);
    }
}