<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Commandes pour livreurs</title>
</head>

<body>
	<header>
		<h1>Livraisons à effectuer :</h1>
	</header>

	<table class="tab">
		<tbody>
			<%-- <c:forEach> --%>
			<tr>
				<td class="client">Données client :<br />
					<ul>
						<li>Nom</li>
						<li>Prénom</li>
						<li>Adresse</li>
						<li>Num commande</li>
					</ul>
				</td>
				<td class="duree">3:15</td>
				<td class="km">1,7 km</td>
				<td class="accepter">
					<form action="http://localhost:8080/Projet_Pizza/livraisons">
						<input type="checkbox">
					</form>
				</td>
			</tr>
			<%-- </c:forEach> --%>
		</tbody>
	</table>
</body>
</html>