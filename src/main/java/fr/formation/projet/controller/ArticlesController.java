package fr.formation.projet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fr.formation.projet.entities.Articles;
import fr.formation.projet.service.ArticleService;

@Controller
@RequestMapping("/articles")
public class ArticlesController {

	@Autowired
	private ArticleService articleService;

	@GetMapping("/list")
	public String listArticle(Model themodel) {
		themodel.addAttribute("article", articleService.getArticles());

		return "list-article";
	}

	@GetMapping("/addarticle")
	public String addArticle(Model themodel) {
		Articles article = new Articles();
		themodel.addAttribute(article);
		return "show-article-form";
	}

	@PostMapping("/processform")
	public String processForm(Model themodel, @ModelAttribute("article") Articles article) {

		// adding logic here
		articleService.addArticle(article);

		// display
		themodel.addAttribute("article", articleService.getArticles());

		return "list-article";
	}

	@GetMapping("/update")
	public String updateArticle(Model themodel, @RequestParam("idArticle") Integer theId) {

		themodel.addAttribute("article", articleService.getSingleArticles(theId));

		return "show-article-form";

	}

	@GetMapping("/delete")
	public String deleteArticle(Model themodel, @RequestParam("idLivraison") Integer theId) {

		// adding logic here
		articleService.deleteArticle(theId);

		// display
		themodel.addAttribute("article", articleService.getArticles());

		return "list-article";

	}

}