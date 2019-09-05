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
    
    public List<Livraison> getCustomer() {
    Session currentsession=sessionfactory.getCurrentSession();
    
    List<Livraison> livraison=currentsession.createQuery("from Customer",Livraison.class).getResultList();
    
    return livraison;
    }
    
    public Boolean addCustomer(Livraison livraison) {
    
        try {
            Session currentsession=sessionfactory.getCurrentSession();
            
            currentsession.save(livraison);
                
        } catch (Exception e) {
            // TODO: handle exception
            return false;
        }
        
        return true;
    }

    
    public Livraison getSingleCustomer(int theId) {
        Session currentsession=sessionfactory.getCurrentSession();
        
        return currentsession.get(Livraison.class,theId);
    }
    
    
    public void deleteCustomer(int theId) {
        Session currentsession=sessionfactory.getCurrentSession();
        
        currentsession.delete(getSingleCustomer(theId));
    }
}