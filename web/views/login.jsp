<%-- 
    Document   : registrarUsuario
    Created on : 11-may-2020, 15:41:36
    Author     : crist
--%>
<%@page import="ModeloDAO.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<link rel="shortcut icon" href="images/logo.png"/>
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
        <link href="styles/login/estilo.css" rel="stylesheet" type="text/css"/>
</head>
<body oncopy="return false" onpaste="return false">
<div class="container" id="container">
	<div class="form-container sign-up-container">
		<form id="form_911240" method="post" action="ValidateUser.jsp">
			<h1><img src="images/logo1.png" alt=""></h1>
			<h1>Crear Cuenta</h1>
                        <br>
                        <span>Ética, Transparencia y Responsabilidad los principales valores de nuestra comunidad</span><br>
			<span>Código de validación para el acceso de registro</span>
			<input type="text" name="codigo" placeholder="Codigo" autocomplete="off" required/>
                        <br>
                        <input type="hidden" name="form_id" value="911240">
			<button id="saveForm" class="button_text" type="submit" name="submit" />Registrar</button>                            
                        <br>
                        <div style="color: black">
            <%if (request.getAttribute("mensajeError") != null) { %>
               ${mensajeError} 
               
            <% } %>
        </div>
                        <br>
		</form>
	</div>
    
	<div class="form-container sign-in-container">
		<form method="post" action="login.jsp">
			<h1><img src="images/logo1.png" alt=""></h1>
			<h1>Iniciar Sesión</h1>
			<br>
                        <label>Nombre de Usuario:</label>
			<input type="text" name="textUsuario" placeholder="Nombre de Usuario" autocomplete="off" required />
                        <label>Contraseña:</label>
			<input type="password" name="textClave" placeholder="Contraseña" autocomplete="off" required />	
                        <br>
                        <button name="btnIngresar">Ingresar</button>
                        <a href="recuperarContra.jsp">¿Has olvidado tu contraseña?</a>
                         <%
            
          UsuarioDAO op = new UsuarioDAO();
          if(request.getParameter("btnIngresar")!=null){
              String nombre=request.getParameter("textUsuario");
              String contra=request.getParameter("textClave");
              HttpSession sesion = request.getSession();
              switch(op.iniciarSesion (nombre, contra)){
                  case 1:
                      sesion.setAttribute("user", nombre);
                      sesion.setAttribute("nivel", 1);
                      response.sendRedirect("../Administrador.jsp");
                   break;
                   
                   case 2:
                      sesion.setAttribute("user", nombre);
                      sesion.setAttribute("nivel", 2);
                      response.sendRedirect("../Residente.jsp");
                   break;
                   
                   case 3:
                      sesion.setAttribute("user", nombre);
                      sesion.setAttribute("nivel", 3);
                      response.sendRedirect("../Vigilante.jsp");
                   break;
                   
                   default:
                       out.write("Usuario NO existe, o contraseña invalida");
                       break;
              }
          }
          
        if (request.getParameter("cerrar")!=null){
            session.invalidate();
        }
        %>
		</form>
	</div>
	<div class="overlay-container">
		<div class="overlay">
			<div class="overlay-panel overlay-left">
				<h1>Bienvenidos</h1>
				<p>Casa grande un espacio donde se encuentra y disfruta de la mejor alternativa en viviendas, beneficiando la calidad de vida, la seguridad personal, familiar y patrimonial de nuestros residentes</p>
				<button class="ghost" id="signIn">Ingresar</button>
			</div>
			<div class="overlay-panel overlay-right">
				<h1>Casa Grande</h1>
				<p>Hagamos del Conjunto Residencial Casa Grande el mejor lugar para vivir, respetando las normas de convivencia y pagando a tiempo</p>
				<button class="ghost" id="signUp">Registrate</button>
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
<div id="dropDownSelect1"></div>
	<script>
		$(".selection-2").select2({
			minimumResultsForSearch: 20,
			dropdownParent: $('#dropDownSelect1')
		});
	</script>
</body>
</html>