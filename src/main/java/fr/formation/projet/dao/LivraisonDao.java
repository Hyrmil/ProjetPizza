package fr.formation.projet.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fr.formation.projet.entities.Livraison;

@Repository
public class LivraisonDao{

    @Autowired
    public SessionFactory sessionfactory;
    
    public List<Livraison> getLivraison() {
    Session currentsession=sessionfactory.getCurrentSession();
    
    List<Livraison> livraison=currentsession.createQuery("from Livraison" + Livraison.class.getName()).list();
    
    return livraison;
    }
    
    public Boolean addLivraison(Livraison livraison) {
    
        try {
            Session currentsession=sessionfactory.getCurrentSession();
            
            currentsession.save(livraison);
                
        } catch (Exception e) {
            return false;
        }
        
        return true;
    }

    
    public Livraison getSingleLivraison(Integer theId) {
        Session currentsession=sessionfactory.getCurrentSession();
        
        return (Livraison) currentsession.get(Livraison.class,theId);
    }
    
    
    public void deleteLivraison(Integer theId) {
        Session currentsession=sessionfactory.getCurrentSession();
        
        currentsession.delete(getSingleLivraison(theId));
    }
}