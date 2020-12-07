<%-- 
    Document   : recuperarContra
    Created on : 22-oct-2020, 16:46:36
    Author     : crist
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>CasaGrande</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="styles/login/estilo.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="container" id="container">
    
	<div class="form-container sign-in-container">
		<form action="contranueva.jsp">
            <h1><img src="images/logo1.png" alt=""></h1>
			<h2>Cambiar Contraseña</h2>
                        <label>Contraseña Nueva:</label>
			<input type="password" name="textUsuario" placeholder="Contraseña Nueva" autocomplete="off" required />
                        <label>Vuelve a escribir la contraseña:</label>
			<input type="password" name="textClave" placeholder="Vuelve a escribir la contraseña:" autocomplete="off" required />
            <br>
			<button href="">Cambiar</button>
                        <a href="../index.html">Casa Grande - Conjunto Residencial</a>
		</form>
	</div>
	<div class="overlay-container">
		<div class="overlay">
			<div class="overlay-panel overlay-right">
				<h1>Casa Grande</h1>
				<p>Casa grande un espacio donde se encuentra y disfrta de la mejor alternativa en viviendas, beneficiando la calidad de vida, la seguridad personal, familiar y patrimonial de nuestros residentes</p>
				<button onclick="location.href='login.jsp'" class="ghost">Iniciar Sesión</button>
			</div>
		</div>
	</div>
</div>

<footer>
	<p>
		El Conjunto <i class="fa fa-heart"></i> Residencial
		<a href="../index.html">Casa Grande</a>
		Estamos formando la mejor comunidad para 
		<a href="nosotros.html">vivir</a>.
	</p>
</footer>
<script src="js/anima.js"></script>
</body>
</html>
