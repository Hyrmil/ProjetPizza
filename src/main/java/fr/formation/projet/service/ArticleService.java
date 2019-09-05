package fr.formation.projet.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fr.formation.projet.dao.ArticlesDao;
import fr.formation.projet.entities.Articles;

@Service
public class ArticleService {

    @Autowired
    private ArticlesDao articleDao;
    
    @Transactional
    public List<Articles> getArticles() {
        
                // do some business processing here ...
            //now call DAO layer
        return articleDao.getArticles();

  }
    
    
    @Transactional
    public boolean addArticle(Articles article) {
        
         // do some business processing  here ...
            //now call DAO layer
        return(articleDao.addArticles(article));
        
    }
    
    @Transactional
    public Articles getSingleArticles(Integer theId) {
        
        // do some business processing here ... 
            //now call DAO layer
        return articleDao.getSingleArticle(theId);
    }
    
    
    @Transactional
    public void deleteArticle(Integer theId) {
         // do some business processing here ...
         //now call DAO layer
    	articleDao.deleteArticle(theId);;
    }
}