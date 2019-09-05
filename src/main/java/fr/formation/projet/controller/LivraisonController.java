package fr.formation.projet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fr.formation.projet.entities.Livraison;
import fr.formation.projet.service.LivraisonService;

@Controller
@RequestMapping("/livraison")
public class LivraisonController {

	@Autowired
	private LivraisonService livraisonService;

	@GetMapping("/list")
	public String listcustomer(Model themodel) {
		themodel.addAttribute("livraison", livraisonService.getLivraison());

		return "list-livraison";
	}

	@GetMapping("/addlivraison")
	public String addCustomer(Model themodel) {
		Livraison livraison = new Livraison();
		themodel.addAttribute(livraison);
		return "show-livraison-form";
	}

	@PostMapping("/processform")
	public String processForm(Model themodel, @ModelAttribute("livraison") Livraison livraison) {

		// adding logic here
		livraisonService.addLivraison(livraison);

		// display
		themodel.addAttribute("livraison", livraisonService.getLivraison());

		return "list-livraison";
	}

	@GetMapping("/update")
	public String updateCustomer(Model themodel, @RequestParam("idLivraison") int theId) {

		themodel.addAttribute("livraison", livraisonService.getSingleLivraison(theId));

		return "show-livraison-form";

	}

	@GetMapping("/delete")
	public String deleteCustomer(Model themodel, @RequestParam("idLivraison") int theId) {

		// adding logic here
		livraisonService.deleteLivraison(theId);

		// display
		themodel.addAttribute("livraison", livraisonService.getLivraison());

		return "list-livraison";

	}

}