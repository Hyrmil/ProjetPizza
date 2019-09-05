package fr.formation.projet.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fr.formation.projet.entities.Articles;

@Repository
public class ArticlesDao {

	@Autowired
	public SessionFactory sessionfactory;

	public List<Articles> getArticles() {
		Session currentsession = sessionfactory.getCurrentSession();

		List<Articles> articles = currentsession.createQuery("from articles" + Articles.class.getName()).list();

		return articles;
	}

	public Boolean addArticles(Articles articles) {

		try {
			Session currentsession = sessionfactory.getCurrentSession();

			currentsession.save(articles);

		} catch (Exception e) {
			return false;
		}

		return true;
	}

	public Articles getSingleArticle(Integer theId) {
		Session currentsession = sessionfactory.getCurrentSession();

		return (Articles) currentsession.get(Articles.class, theId);
	}

	public void deleteArticle(Integer theId) {
		Session currentsession = sessionfactory.getCurrentSession();

		currentsession.delete(getSingleArticle(theId));
	}
}