<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="fr-FR">
<head>
<title>Bienvenue</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<spring:url value="src/main/resources/images/pizza-logo.png" var="logo"></spring:url>
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand text-light">Projet Pizza</a>
				</div>
				<ul class="nav navbar-nav">
					<li class="nav-item"><a class="nav-link">Accueil</a></li>
					<li class="nav-item"><a class="nav-link">Commander</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="nav-item"><a class="nav-link">Sign Up</a></li>
					<li class="nav-item"><a class="nav-link">Login</a></li>
				</ul>
			</div>
		</nav>
	</header>
</body>
</html>