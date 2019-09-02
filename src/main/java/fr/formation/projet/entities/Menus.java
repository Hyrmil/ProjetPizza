package fr.formation.projet.entities;
// Generated 2 sept. 2019 16:48:26 by Hibernate Tools 4.3.5.Final

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Menus generated by hbm2java
 */
@Entity
@Table(name = "menus", catalog = "pizza_db")
public class Menus implements java.io.Serializable {

	private Integer idMenu;
	private Integer prix;
	private Boolean disponibilite;
	private String pizza;
	private String boisson;
	private String dessert;
	private String entree;

	public Menus() {
	}

	public Menus(Integer prix, Boolean disponibilite, String pizza, String boisson, String dessert, String entree) {
		this.prix = prix;
		this.disponibilite = disponibilite;
		this.pizza = pizza;
		this.boisson = boisson;
		this.dessert = dessert;
		this.entree = entree;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "ID_menu", unique = true, nullable = false)
	public Integer getIdMenu() {
		return this.idMenu;
	}

	public void setIdMenu(Integer idMenu) {
		this.idMenu = idMenu;
	}

	@Column(name = "prix")
	public Integer getPrix() {
		return this.prix;
	}

	public void setPrix(Integer prix) {
		this.prix = prix;
	}

	@Column(name = "disponibilite")
	public Boolean getDisponibilite() {
		return this.disponibilite;
	}

	public void setDisponibilite(Boolean disponibilite) {
		this.disponibilite = disponibilite;
	}

	@Column(name = "pizza", length = 30)
	public String getPizza() {
		return this.pizza;
	}

	public void setPizza(String pizza) {
		this.pizza = pizza;
	}

	@Column(name = "boisson", length = 30)
	public String getBoisson() {
		return this.boisson;
	}

	public void setBoisson(String boisson) {
		this.boisson = boisson;
	}

	@Column(name = "dessert", length = 30)
	public String getDessert() {
		return this.dessert;
	}

	public void setDessert(String dessert) {
		this.dessert = dessert;
	}

	@Column(name = "entree", length = 30)
	public String getEntree() {
		return this.entree;
	}

	public void setEntree(String entree) {
		this.entree = entree;
	}

}
