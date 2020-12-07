<%-- 
    Document   : registrarUsuario
    Created on : 20-jun-2020, 14:04:01
    Author     : crist
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="shortcut icon" href="views/images/logo.png"/>
<!DOCTYPE html>
<html>
<head>
	<title>CasaGrande</title>
        <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
    %>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
        
        <link href="views/styles/registrar/registro.css" rel="stylesheet" type="text/css"/>   
</head>
<body oncopy="return false" onpaste="return false" >
<div class="container" id="container">
	<div class="form-container sign-in-container">
		<form action="ControladorUsuario" autocomplete="off">
			<h1><img src="views/images/cabeza1.png" alt=""></h1>
			<h1>Registrate</h1>
                        
                        <label>Nombres:</label>
                        <input type="text" name="txtNom" placeholder="Nombre" pattern="[A-Za-z ]{3,20}" title="Nombre Invalido" maxlength="20" required="required" />
			<label>Apellidos:</label>
                        <input type="text" name="txtApe" placeholder="Apellido" pattern="[A-Za-z ]{3,20}" title="Apellido Invalido" minlength="3" maxlength="20" required="required" /> 
                        <label>Teléfono:</label>
                        <input type="text" name="txtTel" placeholder="Telefono" pattern="[0-9]{10,15}" title="Solo Numeros - No coinide con ningun telefono" minlength="10" maxlength="15" required="required" />              
                        <label>Correo Electronico:</label>
                        <input type="email" name="txtCor" placeholder="Correo Electronico" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" title="No es un correo valido" minlength="10" maxlength="100" required="required" /> 
                        <label for="usuario">Tipo de Usuario:</label>
                        <select class="select-css" name="txtTip" id="usuario" onchange="setUsuario()">
                            <option value="">Seleccione una Opción</option>
                            <option value="2">Residente</option>
                            <option value="3">Vigilante</option>
                        </select>
                        <div id="result">
                        <script type="application/javascript">
                            var div = document.getElementById('result');

                            function setUsuario() {
                               var select = document.getElementById("usuario").value;

                            switch (select) {
  
     case '2':
      document.getElementById("result").innerHTML = "<label>Apartamento:</label><input type='text' name='txtApa' placeholder='Apartamento'/>";
      break;
    case '3':
      document.getElementById("result").innerHTML = "";
      break;
    default:
      document.getElementById("result").innerHTML = "";
  }
                            }
                        </script>
                        </div>
                        <label>Nombre de Usuario:</label>
                        <input type="text" name="txtNus" placeholder="Nombre de Usuario" pattern="[A-Za-z0-9!?-]{8,12}" title="Minimo 8 caracteres, maximo 12" minlength="8" maxlength="12" required="required" /> 
                        <label>Contraseña:</label>
                        <input type="password" name="txtCon" placeholder="Contraseña" pattern="[A-Za-z0-9!?-]{8,12}" title="Contraseña Insegura - Minimo 8 caracteres, maximo 12" minlength="8" maxlength="12" required="required" />
                        <!--<input type="password" name="Clave" placeholder="Vuelve a escribir tu contraseña" pattern="[A-Za-z0-9!?-]{8,12}" title="Minimo 8 caracteres, maximo 12" minlength="8" maxlength="12" required />-->
                        <br>
                        <button><input class="button" type="hidden" name="accion" value="Agregar">Registrar</button>
                        <br>
                        
		</form>
	</div>
	<div class="overlay-container">
		<div class="overlay">
			<div class="overlay-panel overlay-right">
				<h1>Casa Grande</h1>
				<p>Estamos esforzándonos por prestar un mejor servicio a través de las nuevas herramientas disponibles para el uso de todos los residentes</p>
                <p>Hagamos del Conjunto Residencial Casa Grande el mejor lugar para vivir, respetando las normas de convivencia, pagando a tiempo las cuotas de administración y participando de sus actividades</p>
                                <button onclick="location.href='views/login.jsp'">Iniciar Sesión</button>
			</div>
		</div>
	</div>
</div>

<footer>
	<p>
		El Conjunto <i class="fa fa-heart"></i> Residencial
		<a href="index.html">Casa Grande</a>
		Estamos formando la mejor comunidad para 
		<a href="views/nosotros.html">vivir</a>.
	</p>
</footer>
<script src="views/js/anima.js"></script>
<style>
    .select-css {
 display: block;
 font-size: 12px;
 font-family: 'Arial', sans-serif;
 font-weight: 400;
 color: #696969;
 line-height: 40px;
 padding: .12px 15px;
 width: 100%;
 max-width: 100%; 
 box-sizing: border-box;
 margin: 8px 0;
 border: none;
 appearance: none;
 background-color: #eee;
 background-repeat: no-repeat, repeat;
 background-position: right .7em top 50%, 0 0;
 background-size: .68em auto, 100%;
}
.select-css::-ms-expand {
 display: none;
}
.select-css:hover {
 border-color: #888;
}
.select-css:focus {
 border-color: #aaa;
 border-radius: 2px;
 box-shadow: 0 0 1px 2px #222;
 box-shadow: 0 0 0 2px -moz-mac-focusring;
 color: #000; 
 outline: none;
}
.select-css option {
 font-weight:normal;
}
</style>
</body>
</html>

