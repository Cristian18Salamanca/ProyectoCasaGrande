<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <title>Casa Grande - Conjunto Residencial</title>
    <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
    %>
    <meta content="Responsive admin theme build on top of Bootstrap 4" name="description" />
    <meta content="Themesdesign" name="author" />
    <link rel="shortcut icon" href="imagesd/logoB1.png">

    <!--Morris Chart CSS -->
    <link rel="stylesheet" href="plugins/morris/morris.css">

    <link href="Residente_Assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="Residente_Assets/css/metismenu.min.css" rel="stylesheet" type="text/css">
    <link href="Residente_Assets/css/icons.css" rel="stylesheet" type="text/css">
    <link href="Residente_Assets/css/style.css" rel="stylesheet" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js" type="text/javascript"></script>

</head>

<body>
<%
    HttpSession sesion = request.getSession();
    String usuario;
    String nivel;    
    if(sesion.getAttribute("user")!=null && sesion.getAttribute("nivel")!=null){
        usuario=sesion.getAttribute("user").toString();
        nivel=sesion.getAttribute("nivel").toString();
%>
    <div class="header-bg">
        <!-- Navigation Bar-->
        <header id="topnav">
            <div class="topbar-main">
                <div class="container-fluid">

                    <!-- Logo-->
                    <div>
                        <a href="Residente.jsp" class="logo">
                            <span class="logo-light">
                                    <img src="imagesd/logo.png" alt=""> Casa Grande
                            </span>
                        </a>
                    </div>
                    <!-- End Logo-->

                    <div class="menu-extras topbar-custom navbar p-0">
                        
                        <!--Buscar-->
                        <ul class="list-inline d-none d-lg-block mb-0">
                            <li class="hide-phone app-search float-left">
                                <form role="search" class="app-search">
                                    <div class="form-group mb-0">
                                        <input type="text" class="form-control" placeholder="Buscar...">
                                        <button type="submit"><i class="fa fa-search"></i></button>
                                    </div>
                                </form>
                            </li>
                        </ul>

                        <ul class="navbar-right ml-auto list-inline float-right mb-0">
                            
                            <!--lenguage-->                            
                            <li class="dropdown notification-list list-inline-item d-none d-md-inline-block">
                                <a class="nav-link dropdown-toggle arrow-none waves-effect" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                                    <img src="Residente_Assets/images/flags/Col.png" class="mr-2" height="12" alt="" />Colombia - Español
                                </a>
                            </li>

                            <!-- full screen -->
                            <li class="dropdown notification-list list-inline-item d-none d-md-inline-block">
                                <a class="nav-link waves-effect" href="#" id="btn-fullscreen">
                                    <i class="mdi mdi-arrow-expand-all noti-icon"></i>
                                </a>
                            </li>

                            <li class="dropdown notification-list list-inline-item">
                                <div class="dropdown notification-list nav-pro-img">
                                    <a class="dropdown-toggle nav-link arrow-none nav-user" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                                        <% 
                                            Connection conn = 
                                                DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto_casagrande", 
                                                    "root", "");
                                            Statement sql1 = conn.createStatement();
                                            String qry1="select Nombre from usuario where Nombre_Usuario='" + usuario +"'";
                                            ResultSet data1 = sql1.executeQuery(qry1);
                                            while(data1.next()){
                                        %>
                                        <img src="Residente_Assets/images/users/iconuser.jpg" alt="user" class="rounded-circle"><span class="ml-1 pro-user-name"><% out.print(data1.getString(1));%><i class="mdi mdi-chevron-down"></i> </span><% } %>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right profile-dropdown ">
                                        <!-- item-->
                                        <a class="dropdown-item" href="PerfilResidente.jsp"><i class="mdi mdi-account-circle"></i>Perfil</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item text-danger" href="<% out.print("views/login.jsp?cerrar=true"); %>"><i class="mdi mdi-power text-danger"></i>Cerrar Sesión</a>
                                    </div>
                                </div>
                            </li>

                            <li class="menu-item dropdown notification-list list-inline-item">
                                <!-- Mobile menu toggle-->
                                <a class="navbar-toggle nav-link">
                                    <div class="lines">
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                    </div>
                                </a>
                                <!-- End mobile menu toggle-->
                            </li>

                        </ul>

                    </div>
                    <!-- end menu-extras -->

                    <div class="clearfix"></div>

                </div>
                <!-- end container -->
            </div>
            <!-- end topbar-main -->

            <!-- MENU Start -->
            <div class="navbar-custom">
                <div class="container-fluid">

                    <div id="navigation">

                        <!-- Navigation Menu-->
                        <ul class="navigation-menu">

                            <li class="has-submenu">
                                <a href="Residente.jsp"><i class="ti-home"></i>Inicio - Casa Grande</a>
                            </li>

                            <li class="has-submenu">
                                <a href="Residente_Informacion.jsp"><i class="ti-write"></i>Información Residencial</a>
                            </li>   
                        </ul>
                        <!-- End navigation menu -->
                    </div>
                    <!-- end #navigation -->
                </div>
                <!-- end container -->
            </div>
            <!-- end navbar-custom -->
        </header>
        <!-- End Navigation Bar-->

    </div>
    <!-- header-bg -->

    <div class="wrapper">
        <div class="container-fluid">
            <!-- Page-Title -->
            <div class="page-title-box">
                <div class="row align-items-center">
                    <div class="col-sm-6">
                        <h4 class="page-title">Información Residencial</h4>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-right">
                            <li class="breadcrumb-item"><a href="javascript:void(0);">Casa Grande</a></li>
                            <li class="breadcrumb-item"><a href="javascript:void(0);">Inicio</a></li>
                            <li class="breadcrumb-item active">Información Residencial</li>
                        </ol>
                    </div>
                </div>
                <!-- end row -->
            </div>
        
            <div class="row">
                <div class="col-xl-4">
                    <div class="card m-b-30">
                        <div class="card-body">
                            <div class="faq-icon float-right">
                                <div class="spinner-grow text-danger" role="status">
                                    <span class="sr-only">Loading...</span>
                                </div>
                            </div>
                            <h4 class="mt-0 header-title">Casa Grande - Misión</h4>
                            <P class="sub-title">Nos destacamos como una comunidad modelo, liderando con un alto sentido de calidad, cumplimiento y responsabilidad todo con el fin de hacer de este lugar el mejor para vivir donde se tengas valores que generen un ambiente de alegria y felicidad.</P>

                            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                                <div class="carousel-inner" role="listbox">
                                    <div class="carousel-item active">
                                        <img class="d-block img-fluid mx-auto" src="imagesd/img-6.jpg" alt="First slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block img-fluid mx-auto" src="imagesd/img-12.jpg" alt="First slide">
                                    </div>
                                </div>
                                <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Anterior </span>
                                </a>
                                <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Siguiente</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="card m-b-30">
                        <div class="card-body">
                        <h4 class="mt-0 header-title">Casa Grande - Residente</h4>                            
                        <form class="" action="ControladorResidente" >
                            <% 
                                Connection con = 
                                    DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto_casagrande", 
                                        "root", "");
                                Statement sql = con.createStatement();
                                String qry="select apartamento from usuario where Nombre_Usuario='" + usuario +"'";
                                ResultSet data = sql.executeQuery(qry);
                                while(data.next()){
                            %>
                            <div class="form-group">
                                <label>Numero de Apartamento</label>
                                <input type="text" class="form-control" name="txtApa" value="<% out.print(data.getString(1));%>" readonly="readonly"/>
                            </div><% } %>
                                
                            <div class="row">
                                <div class="col-lg-6">
                                    <label>Fecha Inicial de Contrato</label>
                                    <input type="date" id="inicontra" name="txtIco" class="form-control" required placeholder="Fecha Inicial de Contrato"/><br>
                                </div>
                                <div class="col-lg-6">
                                    <label>Fecha Final del Contrato</label>
                                    <input type="date" id="fincontra" name="txtFco" class="form-control" required placeholder="Fecha Final del Contrato"/><br>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <label for="carro">El Residente cuenta con Vehículo:</label>
                                    <select name="txtVeh" id="carro" class="form-control" onchange="setCarro()">
                                    <option value="">Seleccione una Opción</option>
                                    <option value="si">Si</option>
                                    <option value="no">No</option>
                                    </select><br>
                                </div>  
                                <div class="col-lg-6">
                                    <label>Tipo de Residente:</label>
                                    <select name="txtTip" id="txtTip" class="form-control">
                                    <option value="">Seleccione una Opción</option>
                                    <option value="Dueño">Dueño</option>
                                    <option value="Arrendatario">Arrendatario</option>
                                    </select><br>
                                </div>                              
                            </div>
                            <div class="form-group">
                                <label>Arrendado a:</label>
                                <input type="text" id="txtArr" name="txtArr" class="form-control" placeholder="Nombre del Arrendatario y si eres dueño poner un (-)" />
                            </div> 
                            <div class="form-group">
                                <div>
                                    <input type="submit" class="btn btn-primary waves-effect waves-light" name="accion" value="Agregar" onclick="ponerReadOnly('inicontra','fincontra','carro','txtTip','txtArr')">
                                    <button type="reset" class="btn btn-secondary waves-effect m-l-5">Limpiar</button>
                                </div>
                            </div>
                        </form>
<script>
    function ponerReadOnly(id,id1,id2,id3,id4,id5)
    {
        $("#"+id).attr("readonly","readonly");
        $("#"+id).addClass("readOnly");
        $("#"+id1).attr("readonly","readonly");
        $("#"+id1).addClass("readOnly");
        $("#"+id2).attr("readonly","readonly");
        $("#"+id2).addClass("readOnly");
        $("#"+id3).attr("readonly","readonly");
        $("#"+id3).addClass("readOnly");
        $("#"+id4).attr("readonly","readonly");
        $("#"+id4).addClass("readOnly");
    }

</script>
 
    <style>
    .readOnly {color:#808080;}
    input {width:200px;}
    </style>
</div>

</div>
</div>
</div>

            <div id="result">
                <% 
                                Connection con3 = 
                                    DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto_casagrande", 
                                        "root", "");
                                Statement sql3 = con3.createStatement();
                                String qry3="select apartamento from usuario where Nombre_Usuario='" + usuario +"'";
                                ResultSet data3 = sql3.executeQuery(qry3);
                                while(data3.next()){
                %>
                
<script type="text/javascript">
 var div = document.getElementById('result');
function setCarro() {
  var select = document.getElementById("carro").value;
  switch (select) { 
    case 'si': 
      case 'si':
      document.getElementById("result").innerHTML = "<div class='row'><div class='col-xl-8'><div class='card m-b-30'>\n\
<div class='card-body'><h4 class='mt-0 header-title'>Casa Grande - Vehículo</h4><p>Residente Registra tu Vehículo</p><form class='' action='ControladorVehiculo'>\n\
<div class='form-group'><label>Apartamento</label><input type='text' name='txtApa' class='form-control' value='<% out.print(data3.getString(1));%>' readonly='readonly'/></div>\n\
<div class='row'><div class='col-lg-6'><label>Placa</label><input type='text' id='placa' name='txtPla' class='form-control' required placeholder='Placa del Vehículo'/><br></div>\n\
<div class='col-lg-6'><label>Parqueadero</label><input type='text' id='parqueadero' name='txtPar' class='form-control' required placeholder='Parqueadero del Vehículo'/><br></div></div>\n\
<div class='form-group'><label>Dueño del Vehículo</label><input type='text' id='dueño' name='txtDue' class='form-control' required placeholder='Dueño del Vehículo'/></div>\n\
<div class='row'><div class='col-lg-6'><label>Marca</label><input type='text' id='marca' name='txtMar' class='form-control' required placeholder='Marca del Vehículo'/><br></div>\n\
<div class='col-lg-6'><label>Color</label><input name='txtCol' id='color' type='text' class='form-control' required placeholder='Color del Vehículo'/></div></div>\n\
<div class='form-group'><div><input type='submit' class='btn btn-primary waves-effect waves-light' name='accion' value='Agregar'> \n\
<button type='reset' class='btn btn-secondary waves-effect m-l-5'>Cancelar</button></div></div></form></div></div></div><div class='col-xl-4'><div class='card m-b-30'>\n\
<div class='card-body'><h4 class='mt-0 header-title'>Casa Grande - Conjunto Residencial</h4><p class='sub-title'>Se busca mejorar día a día nuestros valores de Ética y Transparencia, Responsabilidad, Respeto, Servicio, Desarrollo Sostenible y Colaboración<br>Estamos esforzándonos por prestar un mejor servicio a través de las nuevas herramientas disponibles para el uso de todos los residentes </p><div id='carouselExampleControls' class='carousel slide' data-ride='carousel'><div class='carousel-inner' role='listbox'><div class='carousel-item active'><img class='d-block img-fluid mx-auto' src='imagesd/img-10.jpg' alt='First slide'></div><div class='carousel-item'><img class='d-block img-fluid mx-auto' src='imagesd/img-7.jpg' alt='Second slide'></div></div><a class='carousel-control-prev' href='#carouselExampleControls' role='button' data-slide='prev'><span class='carousel-control-prev-icon' aria-hidden='true'></span><span class='sr-only'>Anterior </span></a><a class='carousel-control-next' href='#carouselExampleControls' role='button' data-slide='next'><span class='carousel-control-next-icon' aria-hidden='true'></span><span class='sr-only'>Siguiente</span></a></div></div></div></div>";
      break;
    case 'no':
      document.getElementById("result").innerHTML = "";
      break;
    default:
      document.getElementById("result").innerHTML = "";
  }
}
</script><% } %>
            </div>
            
            <div class="row">
                
                <div class="col-xl-8">
                    <div class="card m-b-30">
                        <div class="card-body">

                            <h4 class="mt-0 header-title">Casa Grande - Apartamento</h4>                             
                            <form class="" action="ControladorApartamento">
                            <% 
                                Connection con1 = 
                                    DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto_casagrande", 
                                        "root", "");
                                Statement sql2 = con1.createStatement();
                                String qry2="select apartamento from usuario where Nombre_Usuario='" + usuario +"'";
                                ResultSet data2 = sql2.executeQuery(qry2);
                                while(data2.next()){
                            %>  
                             <div class="form-group">
                                <label>Numero de Apartamento</label>
                                <input type="text" name="txtApa" class="form-control" value="<% out.print(data2.getString(1));%>" readonly="readonly"/>
                            </div> <% } %>
                                
                            <div class="form-group">
                                <label>Dueño Apartamento</label>
                                <input type="text" id="dueñoapa" name="txtDue" class="form-control" required placeholder="Dueño Apartamento"/>
                            </div>
                                
                            <div class="row">
                                <div class="col-lg-6">
                                    <label for="persona">Cantidad de Personas</label>
<select name="txtPer" id="persona" class="form-control" onchange="setPersonas()">
<option value="">Seleccione una Opción</option>
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
<option value="6">6</option>
<option value="7">7</option>
</select>
                                </div>
                                <div class="col-lg-6">
                                    <label>Cantidad de Mascotas</label>
                                    <input type="text" id="mascota" name="txtMas" class="form-control" required placeholder="Cantidad de Mascota"/><br>
                                </div>
                            </div>
                                
                            <div class="form-group">
                                <label>Teléfono</label>
                                <input type="text" id="telefono" name="txtTel" class="form-control" required placeholder="Teléfono"/>
                            </div>
                            <br>
                            <div class="form-group">
                            <div>
                            <input type="submit" class="btn btn-primary waves-effect waves-light" name="accion" value="Agregar" onclick="ReadOnlyApa('dueñoapa','persona','mascota','telefono')">
                            <button type="reset" class="btn btn-secondary waves-effect m-l-5">Limpiar</button>
                            </div>
                            </div>
                            </form> 
                            <script>
    function ReadOnlyApa(id,id1,id2,id3)
    {
        $("#"+id).attr("readonly","readonly");
        $("#"+id).addClass("readOnly");
        $("#"+id1).attr("readonly","readonly");
        $("#"+id1).addClass("readOnly");
        $("#"+id2).attr("readonly","readonly");
        $("#"+id2).addClass("readOnly");
        $("#"+id3).attr("readonly","readonly");
        $("#"+id3).addClass("readOnly");
    }

    </script>
                        </div>
                    </div>
                </div> <!-- end col -->
                <div class="col-xl-4">
                    <div class="card m-b-30">
                        <div class="card-body">
                            <div class="faq-icon float-right">
                                <div class="spinner-grow text-danger" role="status">
                                    <span class="sr-only">Loading...</span>
                                </div>
                            </div>
                            <h4 class="mt-0 header-title">Casa Grande - Visión</h4>
                            <p class="sub-title">Para el 2021 se busca lograr que los copropietarios que se encuentran con cartera vencida cancelen sus espensas vencidas, logrando una recuperación del 50% para beneficio de la calidad de vida, la seguridad personal, familiar y patrimonial<br></p>

                            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                                <div class="carousel-inner" role="listbox">
                                    <div class="carousel-item active">
                                        <img class="d-block img-fluid mx-auto" src="imagesd/img-11.jpg" alt="First slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block img-fluid mx-auto" src="imagesd/img-4.jpg" alt="First slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block img-fluid mx-auto" src="imagesd/img-3.jpg" alt="Third slide">
                                    </div>
                                </div>
                                <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Anterior </span>
                                </a>
                                <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Siguiente</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div> <!-- end row -->          
        <div id="resultado2">
<% 
                                Connection con4 = 
                                    DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto_casagrande", 
                                        "root", "");
                                Statement sql4 = con4.createStatement();
                                String qry4="select apartamento from usuario where Nombre_Usuario='" + usuario +"'";
                                ResultSet data4 = sql4.executeQuery(qry4);
                                while(data4.next()){
                            %> 
<script type="application/javascript">
var div = document.getElementById('resultado2');
function setPersonas() {
  var select = document.getElementById("persona").value; 
  switch (select) {
    case '1':
      document.getElementById("resultado2").innerHTML = "<!-- Imagen --><div class='row'><div class='col-xl-4'><div class='card m-b-30'><div class='card-body'>\n\
     <h4 class='mt-0 header-title'>Casa Grande - Conjunto Residencial</h4><p class='sub-title'>El objetivo es velar por los intereses de quienes han depositado su confianza \n\
     en nosotros, para ello se destacan: Asistir a la asamblea y reuniones necesarias para someter a aprobación el balance general, el inventario y las cuentas del conjunto además se \n\
     debe presentar el presupuesto general<br>Hagamos del Conjunto Residencial Casa Grande el mejor lugar para vivir, respetando las normas de convivencia.</p><div id='carouselExampleControls' \n\
     class='carousel slide' data-ride='carousel'><div class='carousel-inner' role='listbox'><div class='carousel-item active'>\n\
     <img class='d-block img-fluid mx-auto' src='imagesd/img-9.jpg' alt='First slide'></div><div class='carousel-item'>\n\
     <img class='d-block img-fluid mx-auto' src='imagesd/img-8.jpg' alt='Second slide'></div></div><a class='carousel-control-prev' href='#carouselExampleControls' role='button' data-slide='prev'>\n\
     <span class='carousel-control-prev-icon' aria-hidden='true'></span><span class='sr-only'>Anterior </span></a>\n\
     <a class='carousel-control-next' href='#carouselExampleControls' role='button' data-slide='next'><span class='carousel-control-next-icon' aria-hidden='true'></span><span class='sr-only'>\n\
     Siguiente</span></a></div></div></div></div>     <!-- Primer Formulario -->        <div class='col-xl-8'><div class='card m-b-30'><div class='card-body'>\n\
     <h4 class='mt-0 header-title'>Casa Grande - Primera Personas</h4><br><form class='' action='ControladorPersonas'>\n\
     <div class='form-group'><label>Apartamento</label><input type='text' name='txtApa' class='form-control' value='<% out.print(data4.getString(1));%>' readonly='readonly'/></div>\n\
     <div class='form-group'><label>Nombres</label><input type='text' name='txtNom' class='form-control' required placeholder='Nombres'/></div>\n\
     <div class='form-group'><label>Apellidos</label><input type='text' name='txtApe' class='form-control' required placeholder='Apellidos'/></div>\n\
     <div class='form-group'><label>Fecha de Nacimiento</label><input type='date' name='txtNac' class='form-control' required placeholder='Fecha de Nacimiento'/></div>\n\
     <div class='form-group'><label>Teléfono</label><input type='number' name='txtTel' class='form-control' required placeholder='Teléfono'/><br></div><div class='form-group'><div>\n\
     <button type='submit' class='btn btn-primary waves-effect waves-light'><input type='hidden' name='accion' value='Agregar'>Enviar</button> \n\
     <button type='reset' class='btn btn-secondary waves-effect m-l-5'>Cancelar</button></div></div></form>\n\
     </div>\n\
     </div></div></div>";
      break;
    case '2':
      document.getElementById("resultado2").innerHTML = "<!-- Primer Formulario -->  <div class='row'><div class='col-xl-6'><div class='card m-b-30'><div class='card-body'>\n\
     <h4 class='mt-0 header-title'>Casa Grande - Primera Personas</h4><form class='' action='ControladorPersonas'><div class='row'><div class='col-xl-12'><label>Apartamento</label>\n\
     <input type='text' name='txtApa' class='form-control' value='<% out.print(data4.getString(1));%>' readonly='readonly'/><br></div><div class='col-xl-6'><label>Nombres</label>\n\
     <input type='text' name='txtNom' class='form-control' required placeholder='Nombres'/></div><div class='col-xl-6'><label>Apellidos</label>\n\
     <input type='text' name='txtApe' class='form-control' required placeholder='Apellidos'/><br></div></div><div class='row'><div class='col-xl-6'><label>Fecha de Nacimiento</label>\n\
     <input type='date' name='txtNac' class='form-control' required placeholder='Fecha de Nacimiento'/></div><div class='col-xl-6'><label>Teléfono</label>\n\
     <input type='number' name='txtTel' class='form-control' required placeholder='Teléfono'/></div></div><br><div class='form-group'><div><button type='submit' class='btn btn-primary waves-effect waves-light'>\n\
     <input type='hidden' name='accion' value='Agregar'>Enviar</button>  <button type='reset' class='btn btn-secondary waves-effect m-l-5'>Cancelar</button></div></div></form></div></div></div> \n\
     <!-- Segundo Formulario -->\n\
     <div class='col-xl-6'><div class='card m-b-30'><div class='card-body'><h4 class='mt-0 header-title'>Casa Grande - Segunda Personas</h4>\n\
     <form class='' action='ControladorPersonas'><div class='row'><div class='col-xl-12'><label>Apartamento</label><input type='text' class='form-control' \n\
     name='txtApa' value='<% out.print(data4.getString(1));%>' readonly='readonly'/><br></div><div class='col-xl-6'><label>Nombres</label><input type='text' name='txtNom' class='form-control' required placeholder='Nombres'/>\n\
     </div><div class='col-xl-6'><label>Apellidos</label><input type='text' name='txtApe' class='form-control' required placeholder='Apellidos'/><br></div></div><div class='row'><div class='col-xl-6'>\n\
     <label>Fecha de Nacimiento</label><input type='date' name='txtNac' class='form-control' required placeholder='Fecha de Nacimiento'/></div><div class='col-xl-6'><label>Teléfono</label>\n\
     <input type='number' name='txtTel' class='form-control' required placeholder='Teléfono'/></div></div><br><div class='form-group'><div><button type='submit' class='btn btn-primary waves-effect waves-light'>\n\
     <input type='hidden' name='accion' value='Agregar'>Enviar</button>  <button type='reset' class='btn btn-secondary waves-effect m-l-5'>Cancelar</button></div></div></form></div></div></div>\n\
     </div>";
      break;
    case '3':
      document.getElementById("resultado2").innerHTML = "<div class='row'><div class='col-xl-4'><div class='card m-b-30'><div class='card-body'>\n\
      <h4 class='mt-0 header-title'>Casa Grande - Conjunto Residencial</h4><p class='sub-title'>El objetivo es velar por los intereses de quienes han depositado su confianza \n\
     en nosotros, para ello se destacan: Asistir a la asamblea y reuniones necesarias para someter a aprobación el balance general, el inventario y las cuentas del conjunto además se \n\
     debe presentar el presupuesto general<br>Hagamos del Conjunto Residencial Casa Grande el mejor lugar para vivir, respetando las normas de convivencia.</p>\n\
     <div id='carouselExampleControls' class='carousel slide' data-ride='carousel'><div class='carousel-inner' role='listbox'>\n\
      <div class='carousel-item active'><img class='d-block img-fluid mx-auto' src='imagesd/img-9.jpg' alt='First slide'></div><div class='carousel-item'>\n\
      <img class='d-block img-fluid mx-auto' src='imagesd/img-8.jpg' alt='Second slide'></div></div><a class='carousel-control-prev' href='#carouselExampleControls' role='button' data-slide='prev'>\n\
      <span class='carousel-control-prev-icon' aria-hidden='true'></span><span class='sr-only'>Anterior </span></a>\n\
     <a class='carousel-control-next' href='#carouselExampleControls' role='button' data-slide='next'><span class='carousel-control-next-icon' aria-hidden='true'></span><span class='sr-only'>\n\
     Siguiente</span></a></div></div></div></div>               \n\
     <!-- Primer Formulario -->          <div class='col-xl-8'><div class='card m-b-30'><div class='card-body'><h4 class='mt-0 header-title'>Casa Grande - Primera Personas</h4><br>\n\
     <form class='' action='#'><div class='form-group'>\n\
     <div class='form-group'><label>Apartamento</label><input type='text' name='txtApa' class='form-control' value='<% out.print(data4.getString(1));%>' readonly='readonly'/></div>\n\
     <label>Nombres</label><input type='text' class='form-control' required placeholder='Nombres'/></div><div class='form-group'><label>\n\
     Apellidos</label><input type='text' class='form-control' required placeholder='Apellidos'/></div><div class='form-group'><label>Fecha de Nacimiento</label>\n\
     <input type='date' class='form-control' required placeholder='Fecha de Nacimiento'/></div><div class='form-group'><label>Teléfono</label>\n\
     <input type='number' class='form-control' required placeholder='Teléfono'/><br></div><div class='form-group'><div>\n\
     <button type='submit' class='btn btn-primary waves-effect waves-light'>Enviar</button> <button type='reset' class='btn btn-secondary waves-effect m-l-5'>Cancelar</button></div></div></form>\n\
     </div></div></div></div>              <!-- Segundo Formulario -->         <div class='row'><div class='col-xl-6'><div class='card m-b-30'><div class='card-body'>\n\
     <h4 class='mt-0 header-title'>Casa Grande - Segunda Personas</h4><form class='' action='ControladorPersonas'><div class='row'><div class='col-xl-12'><label>Apartamento</label>\n\
     <input type='text' name='txtApa' class='form-control' value='<% out.print(data4.getString(1));%>' readonly='readonly'/><br></div><div class='col-xl-6'><label>Nombres</label>\n\
     <input type='text' name='txtNom' class='form-control' required placeholder='Nombres'/></div><div class='col-xl-6'><label>Apellidos</label>\n\
     <input type='text' name='txtApe' class='form-control' required placeholder='Apellidos'/><br></div></div><div class='row'><div class='col-xl-6'><label>Fecha de Nacimiento</label>\n\
     <input type='date' name='txtNac' class='form-control' required placeholder='Fecha de Nacimiento'/></div><div class='col-xl-6'><label>Teléfono</label>\n\
     <input type='number' name='txtTel' class='form-control' required placeholder='Teléfono'/></div></div><br><div class='form-group'><div><button type='submit' class='btn btn-primary waves-effect waves-light'>\n\
     <input type='hidden' name='accion' value='Agregar'>Enviar</button>  <button type='reset' class='btn btn-secondary waves-effect m-l-5'>Cancelar</button></div></div></form></div></div></div>         \n\
     <!-- Tercero Formulario -->         \n\
     <div class='col-xl-6'><div class='card m-b-30'><div class='card-body'><h4 class='mt-0 header-title'>Casa Grande - Tercera Personas</h4><form class='' action='ControladorPersonas'><div class='row'><div class='col-xl-12'><label>Apartamento</label>\n\
     <input type='text' name='txtApa' class='form-control' value='<% out.print(data4.getString(1));%>' readonly='readonly'/><br></div><div class='col-xl-6'><label>Nombres</label>\n\
     <input type='text' name='txtNom' class='form-control' required placeholder='Nombres'/></div><div class='col-xl-6'><label>Apellidos</label>\n\
     <input type='text' name='txtApe' class='form-control' required placeholder='Apellidos'/><br></div></div><div class='row'><div class='col-xl-6'><label>Fecha de Nacimiento</label>\n\
     <input type='date' name='txtNac' class='form-control' required placeholder='Fecha de Nacimiento'/></div><div class='col-xl-6'><label>Teléfono</label>\n\
     <input type='number' name='txtTel' class='form-control' required placeholder='Teléfono'/></div></div><br><div class='form-group'><div><button type='submit' class='btn btn-primary waves-effect waves-light'>\n\
     <input type='hidden' name='accion' value='Agregar'>Enviar</button>  <button type='reset' class='btn btn-secondary waves-effect m-l-5'>Cancelar</button></div></div></form></div></div></div></div>";
      break;
    case '4':
      document.getElementById("resultado2").innerHTML = "<!-- Primer Formulario -->  <div class='row'><div class='col-xl-6'><div class='card m-b-30'><div class='card-body'>\n\
      <h4 class='mt-0 header-title'>Casa Grande - Primera Personas</h4><form class='' action='ControladorPersonas'><div class='row'><div class='col-xl-12'><label>Apartamento</label>\n\
     <input type='text' name='txtApa' class='form-control' value='<% out.print(data4.getString(1));%>' readonly='readonly'/><br></div><div class='col-xl-6'><label>Nombres</label>\n\
     <input type='text' name='txtNom' class='form-control' required placeholder='Nombres'/></div><div class='col-xl-6'><label>Apellidos</label>\n\
     <input type='text' name='txtApe' class='form-control' required placeholder='Apellidos'/><br></div></div><div class='row'><div class='col-xl-6'><label>Fecha de Nacimiento</label>\n\
     <input type='date' name='txtNac' class='form-control' required placeholder='Fecha de Nacimiento'/></div><div class='col-xl-6'><label>Teléfono</label>\n\
     <input type='number' name='txtTel' class='form-control' required placeholder='Teléfono'/></div></div><br><div class='form-group'><div><button type='submit' class='btn btn-primary waves-effect waves-light'>\n\
     <input type='hidden' name='accion' value='Agregar'>Enviar</button>  <button type='reset' class='btn btn-secondary waves-effect m-l-5'>Cancelar</button></div></div></form></div></div></div>     \n\
      <!-- Segundo Formulario -->  \n\
      <div class='col-xl-6'><div class='card m-b-30'><div class='card-body'><h4 class='mt-0 header-title'>Casa Grande - Segunda Personas</h4>\n\
      <form class='' action='ControladorPersonas'><div class='row'><div class='col-xl-12'><label>Apartamento</label>\n\
     <input type='text' name='txtApa' class='form-control' value='<% out.print(data4.getString(1));%>' readonly='readonly'/><br></div><div class='col-xl-6'><label>Nombres</label>\n\
     <input type='text' name='txtNom' class='form-control' required placeholder='Nombres'/></div><div class='col-xl-6'><label>Apellidos</label>\n\
     <input type='text' name='txtApe' class='form-control' required placeholder='Apellidos'/><br></div></div><div class='row'><div class='col-xl-6'><label>Fecha de Nacimiento</label>\n\
     <input type='date' name='txtNac' class='form-control' required placeholder='Fecha de Nacimiento'/></div><div class='col-xl-6'><label>Teléfono</label>\n\
     <input type='number' name='txtTel' class='form-control' required placeholder='Teléfono'/></div></div><br><div class='form-group'><div><button type='submit' class='btn btn-primary waves-effect waves-light'>\n\
     <input type='hidden' name='accion' value='Agregar'>Enviar</button>  <button type='reset' class='btn btn-secondary waves-effect m-l-5'>Cancelar</button></div></div></form></div></div></div></div>     \n\
      <!-- Tercer Formulario -->\n\
      <div class='row'><div class='col-xl-6'><div class='card m-b-30'><div class='card-body'><h4 class='mt-0 header-title'>Casa Grande - Tercera Personas</h4>\n\
      <form class='' action='ControladorPersonas'><div class='row'><div class='col-xl-12'><label>Apartamento</label>\n\
     <input type='text' name='txtApa' class='form-control' value='<% out.print(data4.getString(1));%>' readonly='readonly'/><br></div><div class='col-xl-6'><label>Nombres</label>\n\
     <input type='text' name='txtNom' class='form-control' required placeholder='Nombres'/></div><div class='col-xl-6'><label>Apellidos</label>\n\
     <input type='text' name='txtApe' class='form-control' required placeholder='Apellidos'/><br></div></div><div class='row'><div class='col-xl-6'><label>Fecha de Nacimiento</label>\n\
     <input type='date' name='txtNac' class='form-control' required placeholder='Fecha de Nacimiento'/></div><div class='col-xl-6'><label>Teléfono</label>\n\
     <input type='number' name='txtTel' class='form-control' required placeholder='Teléfono'/></div></div><br><div class='form-group'><div><button type='submit' class='btn btn-primary waves-effect waves-light'>\n\
     <input type='hidden' name='accion' value='Agregar'>Enviar</button>  <button type='reset' class='btn btn-secondary waves-effect m-l-5'>Cancelar</button></div></div></form></div></div></div>       \n\
      <!-- Cuarto Formulario -->      \n\
      <div class='col-xl-6'><div class='card m-b-30'><div class='card-body'><h4 class='mt-0 header-title'>Casa Grande - Cuarta Personas</h4><form class='' action='ControladorPersonas'><div class='row'><div class='col-xl-12'><label>Apartamento</label>\n\
     <input type='text' name='txtApa' class='form-control' value='<% out.print(data4.getString(1));%>' readonly='readonly'/><br></div><div class='col-xl-6'><label>Nombres</label>\n\
     <input type='text' name='txtNom' class='form-control' required placeholder='Nombres'/></div><div class='col-xl-6'><label>Apellidos</label>\n\
     <input type='text' name='txtApe' class='form-control' required placeholder='Apellidos'/><br></div></div><div class='row'><div class='col-xl-6'><label>Fecha de Nacimiento</label>\n\
     <input type='date' name='txtNac' class='form-control' required placeholder='Fecha de Nacimiento'/></div><div class='col-xl-6'><label>Teléfono</label>\n\
     <input type='number' name='txtTel' class='form-control' required placeholder='Teléfono'/></div></div><br><div class='form-group'><div><button type='submit' class='btn btn-primary waves-effect waves-light'>\n\
     <input type='hidden' name='accion' value='Agregar'>Enviar</button>  <button type='reset' class='btn btn-secondary waves-effect m-l-5'>Cancelar</button></div></div></form></div></div></div></div>";
      break;
    case '5':
      document.getElementById("resultado2").innerHTML = "<!-- Primer Formulario -->  \n\
      <div class='row'><div class='col-xl-6'><div class='card m-b-30'><div class='card-body'><h4 class='mt-0 header-title'>Casa Grande - Primera Personas</h4><form class='' action='ControladorPersonas'><div class='row'><div class='col-xl-12'><label>Apartamento</label>\n\
     <input type='text' name='txtApa' class='form-control' value='<% out.print(data4.getString(1));%>' readonly='readonly'/><br></div><div class='col-xl-6'><label>Nombres</label>\n\
     <input type='text' name='txtNom' class='form-control' required placeholder='Nombres'/></div><div class='col-xl-6'><label>Apellidos</label>\n\
     <input type='text' name='txtApe' class='form-control' required placeholder='Apellidos'/><br></div></div><div class='row'><div class='col-xl-6'><label>Fecha de Nacimiento</label>\n\
     <input type='date' name='txtNac' class='form-control' required placeholder='Fecha de Nacimiento'/></div><div class='col-xl-6'><label>Teléfono</label>\n\
     <input type='number' name='txtTel' class='form-control' required placeholder='Teléfono'/></div></div><br><div class='form-group'><div><button type='submit' class='btn btn-primary waves-effect waves-light'>\n\
     <input type='hidden' name='accion' value='Agregar'>Enviar</button>  <button type='reset' class='btn btn-secondary waves-effect m-l-5'>Cancelar</button></div></div></form></div></div></div>     \n\
      <!-- Segundo Formulario -->  \n\
      <div class='col-xl-6'><div class='card m-b-30'><div class='card-body'><h4 class='mt-0 header-title'>Casa Grande - Segunda Personas</h4><form class='' action='ControladorPersonas'><div class='row'><div class='col-xl-12'><label>Apartamento</label>\n\
     <input type='text' name='txtApa' class='form-control' value='<% out.print(data4.getString(1));%>' readonly='readonly'/><br></div><div class='col-xl-6'><label>Nombres</label>\n\
     <input type='text' name='txtNom' class='form-control' required placeholder='Nombres'/></div><div class='col-xl-6'><label>Apellidos</label>\n\
     <input type='text' name='txtApe' class='form-control' required placeholder='Apellidos'/><br></div></div><div class='row'><div class='col-xl-6'><label>Fecha de Nacimiento</label>\n\
     <input type='date' name='txtNac' class='form-control' required placeholder='Fecha de Nacimiento'/></div><div class='col-xl-6'><label>Teléfono</label>\n\
     <input type='number' name='txtTel' class='form-control' required placeholder='Teléfono'/></div></div><br><div class='form-group'><div><button type='submit' class='btn btn-primary waves-effect waves-light'>\n\
     <input type='hidden' name='accion' value='Agregar'>Enviar</button>  <button type='reset' class='btn btn-secondary waves-effect m-l-5'>Cancelar</button></div></div></form></div></div></div></div>     \n\
      <!-- Tercer Formulario -->       \n\
      <div class='row'><div class='col-xl-6'><div class='card m-b-30'><div class='card-body'><h4 class='mt-0 header-title'>Casa Grande - Tercera Personas</h4>\n\
      <form class='' action='ControladorPersonas'><div class='row'><div class='col-xl-12'><label>Apartamento</label>\n\
     <input type='text' name='txtApa' class='form-control' value='<% out.print(data4.getString(1));%>' readonly='readonly'/><br></div><div class='col-xl-6'><label>Nombres</label>\n\
     <input type='text' name='txtNom' class='form-control' required placeholder='Nombres'/></div><div class='col-xl-6'><label>Apellidos</label>\n\
     <input type='text' name='txtApe' class='form-control' required placeholder='Apellidos'/><br></div></div><div class='row'><div class='col-xl-6'><label>Fecha de Nacimiento</label>\n\
     <input type='date' name='txtNac' class='form-control' required placeholder='Fecha de Nacimiento'/></div><div class='col-xl-6'><label>Teléfono</label>\n\
     <input type='number' name='txtTel' class='form-control' required placeholder='Teléfono'/></div></div><br><div class='form-group'><div><button type='submit' class='btn btn-primary waves-effect waves-light'>\n\
     <input type='hidden' name='accion' value='Agregar'>Enviar</button>  <button type='reset' class='btn btn-secondary waves-effect m-l-5'>Cancelar</button></div></div></form></div></div></div>       \n\
      <!-- Cuarto Formulario -->      \n\
      <div class='col-xl-6'><div class='card m-b-30'><div class='card-body'><h4 class='mt-0 header-title'>Casa Grande - Cuarta Personas</h4><form class='' action='ControladorPersonas'><div class='row'><div class='col-xl-12'><label>Apartamento</label>\n\
     <input type='text' name='txtApa' class='form-control' value='<% out.print(data4.getString(1));%>' readonly='readonly'/><br></div><div class='col-xl-6'><label>Nombres</label>\n\
     <input type='text' name='txtNom' class='form-control' required placeholder='Nombres'/></div><div class='col-xl-6'><label>Apellidos</label>\n\
     <input type='text' name='txtApe' class='form-control' required placeholder='Apellidos'/><br></div></div><div class='row'><div class='col-xl-6'><label>Fecha de Nacimiento</label>\n\
     <input type='date' name='txtNac' class='form-control' required placeholder='Fecha de Nacimiento'/></div><div class='col-xl-6'><label>Teléfono</label>\n\
     <input type='number' name='txtTel' class='form-control' required placeholder='Teléfono'/></div></div><br><div class='form-group'><div><button type='submit' class='btn btn-primary waves-effect waves-light'>\n\
     <input type='hidden' name='accion' value='Agregar'>Enviar</button>  <button type='reset' class='btn btn-secondary waves-effect m-l-5'>Cancelar</button></div></div></form></div></div></div></div>       \n\
      <!-- Imagen -->       <div class='row'><div class='col-xl-4'><div class='card m-b-30'><div class='card-body'><h4 class='mt-0 header-title'>Casa Grande - Conjunto Residencial</h4>\n\
      <p class='sub-title'>El objetivo es velar por los intereses de quienes han depositado su confianza \n\
     en nosotros, para ello se destacan: Asistir a la asamblea y reuniones necesarias para someter a aprobación el balance general, el inventario y las cuentas del conjunto además se \n\
     debe presentar el presupuesto general<br>Hagamos del Conjunto Residencial Casa Grande el mejor lugar para vivir, respetando las normas de convivencia.</p>\n\
      <div id='carouselExampleControls' class='carousel slide' data-ride='carousel'><div class='carousel-inner' role='listbox'><div class='carousel-item active'>\n\
      <img class='d-block img-fluid mx-auto' src='imagesd/img-9.jpg' alt='First slide'></div><div class='carousel-item'>\n\
      <img class='d-block img-fluid mx-auto' src='imagesd/img-8.jpg' alt='Second slide'></div></div>\n\
      <a class='carousel-control-prev' href='#carouselExampleControls' role='button' data-slide='prev'><span class='carousel-control-prev-icon' aria-hidden='true'></span>\n\
      <span class='sr-only'>Anterior </span></a>\n\
      <a class='carousel-control-next' href='#carouselExampleControls' role='button' data-slide='next'><span class='carousel-control-next-icon' aria-hidden='true'></span>\n\
      <span class='sr-only'>Siguiente</span></a></div></div></div></div>     <!-- Quinto Formulario -->        <div class='col-xl-8'><div class='card m-b-30'><div class='card-body'>\n\
      <h4 class='mt-0 header-title'>Casa Grande - Quinta Personas</h4><br><form class='' action='ControladorPersonas'>\n\
     <div class='form-group'><label>Apartamento</label><input type='text' name='txtApa' class='form-control' value='<% out.print(data4.getString(1));%>' readonly='readonly'/></div>\n\
     <div class='form-group'><label>Nombres</label><input type='text' name='txtNom' class='form-control' required placeholder='Nombres'/></div>\n\
     <div class='form-group'><label>Apellidos</label><input type='text' name='txtApe' class='form-control' required placeholder='Apellidos'/></div>\n\
     <div class='form-group'><label>Fecha de Nacimiento</label><input type='date' name='txtNac' class='form-control' required placeholder='Fecha de Nacimiento'/></div>\n\
     <div class='form-group'><label>Teléfono</label><input type='number' name='txtTel' class='form-control' required placeholder='Teléfono'/><br></div><div class='form-group'><div>\n\
     <button type='submit' class='btn btn-primary waves-effect waves-light'><input type='hidden' name='accion' value='Agregar'>Enviar</button> \n\
     <button type='reset' class='btn btn-secondary waves-effect m-l-5'>Cancelar</button></div></div></form></div></div></div></div>";
      break;
    case '6':
      document.getElementById("resultado2").innerHTML = "<!-- Primer Formulario -->  <div class='row'><div class='col-xl-6'><div class='card m-b-30'><div class='card-body'>\n\
     <h4 class='mt-0 header-title'>Casa Grande - Primera Personas</h4><form class='' action='ControladorPersonas'><div class='row'><div class='col-xl-12'><label>Apartamento</label>\n\
     <input type='text' name='txtApa' class='form-control' value='<% out.print(data4.getString(1));%>' readonly='readonly'/><br></div><div class='col-xl-6'><label>Nombres</label>\n\
     <input type='text' name='txtNom' class='form-control' required placeholder='Nombres'/></div><div class='col-xl-6'><label>Apellidos</label>\n\
     <input type='text' name='txtApe' class='form-control' required placeholder='Apellidos'/><br></div></div><div class='row'><div class='col-xl-6'><label>Fecha de Nacimiento</label>\n\
     <input type='date' name='txtNac' class='form-control' required placeholder='Fecha de Nacimiento'/></div><div class='col-xl-6'><label>Teléfono</label>\n\
     <input type='number' name='txtTel' class='form-control' required placeholder='Teléfono'/></div></div><br><div class='form-group'><div><button type='submit' class='btn btn-primary waves-effect waves-light'>\n\
     <input type='hidden' name='accion' value='Agregar'>Enviar</button>  <button type='reset' class='btn btn-secondary waves-effect m-l-5'>Cancelar</button></div></div></form>\n\
     </div></div></div>     \n\
     <!-- Segundo Formulario --> \n\
     <div class='col-xl-6'><div class='card m-b-30'><div class='card-body'><h4 class='mt-0 header-title'>Casa Grande - Segunda Personas</h4><form class='' action='ControladorPersonas'><div class='row'><div class='col-xl-12'><label>Apartamento</label>\n\
     <input type='text' name='txtApa' class='form-control' value='<% out.print(data4.getString(1));%>' readonly='readonly'/><br></div><div class='col-xl-6'><label>Nombres</label>\n\
     <input type='text' name='txtNom' class='form-control' required placeholder='Nombres'/></div><div class='col-xl-6'><label>Apellidos</label>\n\
     <input type='text' name='txtApe' class='form-control' required placeholder='Apellidos'/><br></div></div><div class='row'><div class='col-xl-6'><label>Fecha de Nacimiento</label>\n\
     <input type='date' name='txtNac' class='form-control' required placeholder='Fecha de Nacimiento'/></div><div class='col-xl-6'><label>Teléfono</label>\n\
     <input type='number' name='txtTel' class='form-control' required placeholder='Teléfono'/></div></div><br><div class='form-group'><div><button type='submit' class='btn btn-primary waves-effect waves-light'>\n\
     <input type='hidden' name='accion' value='Agregar'>Enviar</button>  <button type='reset' class='btn btn-secondary waves-effect m-l-5'>Cancelar</button></div></div></form></div></div></div></div>     \n\
     <!-- Tercer Formulario -->       \n\
     <div class='row'><div class='col-xl-6'><div class='card m-b-30'><div class='card-body'><h4 class='mt-0 header-title'>Casa Grande - Tercera Personas</h4><form class='' action='ControladorPersonas'><div class='row'><div class='col-xl-12'><label>Apartamento</label>\n\
     <input type='text' name='txtApa' class='form-control' value='<% out.print(data4.getString(1));%>' readonly='readonly'/><br></div><div class='col-xl-6'><label>Nombres</label>\n\
     <input type='text' name='txtNom' class='form-control' required placeholder='Nombres'/></div><div class='col-xl-6'><label>Apellidos</label>\n\
     <input type='text' name='txtApe' class='form-control' required placeholder='Apellidos'/><br></div></div><div class='row'><div class='col-xl-6'><label>Fecha de Nacimiento</label>\n\
     <input type='date' name='txtNac' class='form-control' required placeholder='Fecha de Nacimiento'/></div><div class='col-xl-6'><label>Teléfono</label>\n\
     <input type='number' name='txtTel' class='form-control' required placeholder='Teléfono'/></div></div><br><div class='form-group'><div><button type='submit' class='btn btn-primary waves-effect waves-light'>\n\
     <input type='hidden' name='accion' value='Agregar'>Enviar</button>  <button type='reset' class='btn btn-secondary waves-effect m-l-5'>Cancelar</button></div></div></form></div></div></div>       \n\
     <!-- Cuarto Formulario -->      \n\
     <div class='col-xl-6'><div class='card m-b-30'><div class='card-body'><h4 class='mt-0 header-title'>Casa Grande - Cuarta Personas</h4><form class='' action='ControladorPersonas'><div class='row'><div class='col-xl-12'><label>Apartamento</label>\n\
     <input type='text' name='txtApa' class='form-control' value='<% out.print(data4.getString(1));%>' readonly='readonly'/><br></div><div class='col-xl-6'><label>Nombres</label>\n\
     <input type='text' name='txtNom' class='form-control' required placeholder='Nombres'/></div><div class='col-xl-6'><label>Apellidos</label>\n\
     <input type='text' name='txtApe' class='form-control' required placeholder='Apellidos'/><br></div></div><div class='row'><div class='col-xl-6'><label>Fecha de Nacimiento</label>\n\
     <input type='date' name='txtNac' class='form-control' required placeholder='Fecha de Nacimiento'/></div><div class='col-xl-6'><label>Teléfono</label>\n\
     <input type='number' name='txtTel' class='form-control' required placeholder='Teléfono'/></div></div><br><div class='form-group'><div><button type='submit' class='btn btn-primary waves-effect waves-light'>\n\
     <input type='hidden' name='accion' value='Agregar'>Enviar</button>  <button type='reset' class='btn btn-secondary waves-effect m-l-5'>Cancelar</button></div></div></form></div></div></div></div>   \n\
     <!-- Quinto Formulario -->  \n\
     <div class='row'><div class='col-xl-6'><div class='card m-b-30'><div class='card-body'><h4 class='mt-0 header-title'>Casa Grande - Quinta Personas</h4>\n\
     <form class='' action='ControladorPersonas'><div class='row'><div class='col-xl-12'><label>Apartamento</label>\n\
     <input type='text' name='txtApa' class='form-control' value='<% out.print(data4.getString(1));%>' readonly='readonly'/><br></div><div class='col-xl-6'><label>Nombres</label>\n\
     <input type='text' name='txtNom' class='form-control' required placeholder='Nombres'/></div><div class='col-xl-6'><label>Apellidos</label>\n\
     <input type='text' name='txtApe' class='form-control' required placeholder='Apellidos'/><br></div></div><div class='row'><div class='col-xl-6'><label>Fecha de Nacimiento</label>\n\
     <input type='date' name='txtNac' class='form-control' required placeholder='Fecha de Nacimiento'/></div><div class='col-xl-6'><label>Teléfono</label>\n\
     <input type='number' name='txtTel' class='form-control' required placeholder='Teléfono'/></div></div><br><div class='form-group'><div><button type='submit' class='btn btn-primary waves-effect waves-light'>\n\
     <input type='hidden' name='accion' value='Agregar'>Enviar</button>  <button type='reset' class='btn btn-secondary waves-effect m-l-5'>Cancelar</button></div></div></form></div></div></div>     \n\
     <!-- Sexta Formulario -->  \n\
     <div class='col-xl-6'><div class='card m-b-30'><div class='card-body'><h4 class='mt-0 header-title'>\n\
     Casa Grande - Sexta Personas</h4><form class='' action='ControladorPersonas'><div class='row'><div class='col-xl-12'><label>Apartamento</label>\n\
     <input type='text' name='txtApa' class='form-control' value='<% out.print(data4.getString(1));%>' readonly='readonly'/><br></div><div class='col-xl-6'><label>Nombres</label>\n\
     <input type='text' name='txtNom' class='form-control' required placeholder='Nombres'/></div><div class='col-xl-6'><label>Apellidos</label>\n\
     <input type='text' name='txtApe' class='form-control' required placeholder='Apellidos'/><br></div></div><div class='row'><div class='col-xl-6'><label>Fecha de Nacimiento</label>\n\
     <input type='date' name='txtNac' class='form-control' required placeholder='Fecha de Nacimiento'/></div><div class='col-xl-6'><label>Teléfono</label>\n\
     <input type='number' name='txtTel' class='form-control' required placeholder='Teléfono'/></div></div><br><div class='form-group'><div><button type='submit' class='btn btn-primary waves-effect waves-light'>\n\
     <input type='hidden' name='accion' value='Agregar'>Enviar</button>  <button type='reset' class='btn btn-secondary waves-effect m-l-5'>Cancelar</button></div></div></form></div></div></div></div>";
      break;
    case '7':
      document.getElementById("resultado2").innerHTML = "<!-- Primer Formulario -->  \n\
      <div class='row'><div class='col-xl-6'><div class='card m-b-30'><div class='card-body'><h4 class='mt-0 header-title'>Casa Grande - Primera Personas</h4>\n\
      <form class='' action='ControladorPersonas'><div class='row'><div class='col-xl-12'><label>Apartamento</label>\n\
     <input type='text' name='txtApa' class='form-control' value='<% out.print(data4.getString(1));%>' readonly='readonly'/><br></div><div class='col-xl-6'><label>Nombres</label>\n\
     <input type='text' name='txtNom' class='form-control' required placeholder='Nombres'/></div><div class='col-xl-6'><label>Apellidos</label>\n\
     <input type='text' name='txtApe' class='form-control' required placeholder='Apellidos'/><br></div></div><div class='row'><div class='col-xl-6'><label>Fecha de Nacimiento</label>\n\
     <input type='date' name='txtNac' class='form-control' required placeholder='Fecha de Nacimiento'/></div><div class='col-xl-6'><label>Teléfono</label>\n\
     <input type='number' name='txtTel' class='form-control' required placeholder='Teléfono'/></div></div><br><div class='form-group'><div><button type='submit' class='btn btn-primary waves-effect waves-light'>\n\
     <input type='hidden' name='accion' value='Agregar'>Enviar</button>  <button type='reset' class='btn btn-secondary waves-effect m-l-5'>Cancelar</button></div></div></form></div></div></div>     \n\
      <!-- Segundo Formulario -->  \n\
      <div class='col-xl-6'><div class='card m-b-30'><div class='card-body'><h4 class='mt-0 header-title'>Casa Grande - Segunda Personas</h4><form class='' action='ControladorPersonas'><div class='row'><div class='col-xl-12'><label>Apartamento</label>\n\
     <input type='text' name='txtApa' class='form-control' value='<% out.print(data4.getString(1));%>' readonly='readonly'/><br></div><div class='col-xl-6'><label>Nombres</label>\n\
     <input type='text' name='txtNom' class='form-control' required placeholder='Nombres'/></div><div class='col-xl-6'><label>Apellidos</label>\n\
     <input type='text' name='txtApe' class='form-control' required placeholder='Apellidos'/><br></div></div><div class='row'><div class='col-xl-6'><label>Fecha de Nacimiento</label>\n\
     <input type='date' name='txtNac' class='form-control' required placeholder='Fecha de Nacimiento'/></div><div class='col-xl-6'><label>Teléfono</label>\n\
     <input type='number' name='txtTel' class='form-control' required placeholder='Teléfono'/></div></div><br><div class='form-group'><div><button type='submit' class='btn btn-primary waves-effect waves-light'>\n\
     <input type='hidden' name='accion' value='Agregar'>Enviar</button>  <button type='reset' class='btn btn-secondary waves-effect m-l-5'>Cancelar</button></div></div></form></div></div></div></div>     \n\
     <!-- Tercer Formulario -->\n\
     <div class='row'><div class='col-xl-6'><div class='card m-b-30'><div class='card-body'><h4 class='mt-0 header-title'>Casa Grande - Tercera Personas</h4>\n\
     <form class='' action='ControladorPersonas'><div class='row'><div class='col-xl-12'><label>Apartamento</label>\n\
     <input type='text' name='txtApa' class='form-control' value='<% out.print(data4.getString(1));%>' readonly='readonly'/><br></div><div class='col-xl-6'><label>Nombres</label>\n\
     <input type='text' name='txtNom' class='form-control' required placeholder='Nombres'/></div><div class='col-xl-6'><label>Apellidos</label>\n\
     <input type='text' name='txtApe' class='form-control' required placeholder='Apellidos'/><br></div></div><div class='row'><div class='col-xl-6'><label>Fecha de Nacimiento</label>\n\
     <input type='date' name='txtNac' class='form-control' required placeholder='Fecha de Nacimiento'/></div><div class='col-xl-6'><label>Teléfono</label>\n\
     <input type='number' name='txtTel' class='form-control' required placeholder='Teléfono'/></div></div><br><div class='form-group'><div><button type='submit' class='btn btn-primary waves-effect waves-light'>\n\
     <input type='hidden' name='accion' value='Agregar'>Enviar</button>  <button type='reset' class='btn btn-secondary waves-effect m-l-5'>Cancelar</button></div></div></form></div></div></div>       \n\
     <!-- Cuarto Formulario -->      \n\
     <div class='col-xl-6'><div class='card m-b-30'><div class='card-body'><h4 class='mt-0 header-title'>Casa Grande - Cuarta Personas</h4><form class='' action='ControladorPersonas'><div class='row'><div class='col-xl-12'><label>Apartamento</label>\n\
     <input type='text' name='txtApa' class='form-control' value='<% out.print(data4.getString(1));%>' readonly='readonly'/><br></div><div class='col-xl-6'><label>Nombres</label>\n\
     <input type='text' name='txtNom' class='form-control' required placeholder='Nombres'/></div><div class='col-xl-6'><label>Apellidos</label>\n\
     <input type='text' name='txtApe' class='form-control' required placeholder='Apellidos'/><br></div></div><div class='row'><div class='col-xl-6'><label>Fecha de Nacimiento</label>\n\
     <input type='date' name='txtNac' class='form-control' required placeholder='Fecha de Nacimiento'/></div><div class='col-xl-6'><label>Teléfono</label>\n\
     <input type='number' name='txtTel' class='form-control' required placeholder='Teléfono'/></div></div><br><div class='form-group'><div><button type='submit' class='btn btn-primary waves-effect waves-light'>\n\
     <input type='hidden' name='accion' value='Agregar'>Enviar</button>  <button type='reset' class='btn btn-secondary waves-effect m-l-5'>Cancelar</button></div></div></form></div></div></div></div>       \n\
     <!-- Imagen -->       \n\
     <div class='row'><div class='col-xl-4'><div class='card m-b-30'><div class='card-body'><h4 class='mt-0 header-title'>Casa Grande - Conjunto Residencial</h4>\n\
     <p class='sub-title'>El objetivo es velar por los intereses de quienes han depositado su confianza \n\
     en nosotros, para ello se destacan: Asistir a la asamblea y reuniones necesarias para someter a aprobación el balance general, el inventario y las cuentas del conjunto además se \n\
     debe presentar el presupuesto general<br>Hagamos del Conjunto Residencial Casa Grande el mejor lugar para vivir, respetando las normas de convivencia.</p>\n\
     <div id='carouselExampleControls' class='carousel slide' data-ride='carousel'><div class='carousel-inner' role='listbox'><div class='carousel-item active'>\n\
     <img class='d-block img-fluid mx-auto' src='imagesd/img-9.jpg' alt='First slide'></div><div class='carousel-item'>\n\
     <img class='d-block img-fluid mx-auto' src='imagesd/img-8.jpg' alt='Second slide'></div></div><a class='carousel-control-prev' href='#carouselExampleControls' role='button' data-slide='prev'>\n\
     <span class='carousel-control-prev-icon' aria-hidden='true'></span><span class='sr-only'>Anterior </span></a>\n\
     <a class='carousel-control-next' href='#carouselExampleControls' role='button' data-slide='next'><span class='carousel-control-next-icon' aria-hidden='true'></span>\n\
      <span class='sr-only'>Siguiente</span></a></div></div></div></div>     \n\
       <!-- Quinto Formulario -->        \n\
      <div class='col-xl-8'><div class='card m-b-30'><div class='card-body'><h4 class='mt-0 header-title'>Casa Grande - Quinta Personas</h4><br><form class='' action='ControladorPersonas'>\n\
     <div class='form-group'><label>Apartamento</label><input type='text' name='txtApa' class='form-control' value='<% out.print(data4.getString(1));%>' readonly='readonly'/></div>\n\
     <div class='form-group'><label>Nombres</label><input type='text' name='txtNom' class='form-control' required placeholder='Nombres'/></div>\n\
     <div class='form-group'><label>Apellidos</label><input type='text' name='txtApe' class='form-control' required placeholder='Apellidos'/></div>\n\
     <div class='form-group'><label>Fecha de Nacimiento</label><input type='date' name='txtNac' class='form-control' required placeholder='Fecha de Nacimiento'/></div>\n\
     <div class='form-group'><label>Teléfono</label><input type='number' name='txtTel' class='form-control' required placeholder='Teléfono'/><br></div><div class='form-group'><div>\n\
     <button type='submit' class='btn btn-primary waves-effect waves-light'><input type='hidden' name='accion' value='Agregar'>Enviar</button> \n\
     <button type='reset' class='btn btn-secondary waves-effect m-l-5'>Cancelar</button></div></div></form></div></div></div></div>       \n\
      <!-- Sexto Formulario -->  \n\
      <div class='row'><div class='col-xl-6'><div class='card m-b-30'><div class='card-body'><h4 class='mt-0 header-title'>Casa Grande - Sexta Personas</h4>\n\
      <form class='' action='ControladorPersonas'><div class='row'><div class='col-xl-12'><label>Apartamento</label>\n\
     <input type='text' name='txtApa' class='form-control' value='<% out.print(data4.getString(1));%>' readonly='readonly'/><br></div><div class='col-xl-6'><label>Nombres</label>\n\
     <input type='text' name='txtNom' class='form-control' required placeholder='Nombres'/></div><div class='col-xl-6'><label>Apellidos</label>\n\
     <input type='text' name='txtApe' class='form-control' required placeholder='Apellidos'/><br></div></div><div class='row'><div class='col-xl-6'><label>Fecha de Nacimiento</label>\n\
     <input type='date' name='txtNac' class='form-control' required placeholder='Fecha de Nacimiento'/></div><div class='col-xl-6'><label>Teléfono</label>\n\
     <input type='number' name='txtTel' class='form-control' required placeholder='Teléfono'/></div></div><br><div class='form-group'><div><button type='submit' class='btn btn-primary waves-effect waves-light'>\n\
     <input type='hidden' name='accion' value='Agregar'>Enviar</button>  <button type='reset' class='btn btn-secondary waves-effect m-l-5'>Cancelar</button></div></div></form></div></div></div>        \n\
      <!-- Septima Formulario -->          \n\
     <div class='col-xl-6'><div class='card m-b-30'><div class='card-body'><h4 class='mt-0 header-title'>Casa Grande - Septima Personas</h4><form class='' action='ControladorPersonas'><div class='row'><div class='col-xl-12'><label>Apartamento</label>\n\
     <input type='text' name='txtApa' class='form-control' value='<% out.print(data4.getString(1));%>' readonly='readonly'/><br></div><div class='col-xl-6'><label>Nombres</label>\n\
     <input type='text' name='txtNom' class='form-control' required placeholder='Nombres'/></div><div class='col-xl-6'><label>Apellidos</label>\n\
     <input type='text' name='txtApe' class='form-control' required placeholder='Apellidos'/><br></div></div><div class='row'><div class='col-xl-6'><label>Fecha de Nacimiento</label>\n\
     <input type='date' name='txtNac' class='form-control' required placeholder='Fecha de Nacimiento'/></div><div class='col-xl-6'><label>Teléfono</label>\n\
     <input type='number' name='txtTel' class='form-control' required placeholder='Teléfono'/></div></div><br><div class='form-group'><div><button type='submit' class='btn btn-primary waves-effect waves-light'>\n\
     <input type='hidden' name='accion' value='Agregar'>Enviar</button>  <button type='reset' class='btn btn-secondary waves-effect m-l-5'>Cancelar</button></div></div></form></div></div></div></div>";
      break;
    default:
      document.getElementById("resultado2").innerHTML = "";
  }
}
</script><% } %>
</div>
        </div>
        <!-- end container-fluid -->
    </div>
    <!-- end wrapper -->

    <!-- Footer -->
    <footer class="footer">
        © 2020 Casa Grande - Conjunto Residencial <span class="d-none d-sm-inline-block"> -  Estamos formando la mejor comunidad para vivir <i class="mdi mdi-heart text-danger"></i></span>.
    </footer>

    <!-- End Footer -->

    <!-- jQuery  -->
    <script src="Residente_Assets/js/jquery.min.js"></script>
    <script src="Residente_Assets/js/bootstrap.bundle.min.js"></script>
    <script src="Residente_Assets/js/jquery.slimscroll.js"></script>
    <script src="Residente_Assets/js/waves.min.js"></script>
    

    <!-- App js -->
    <script src="Residente_Assets/js/app.js"></script>
<%
    }else{
       out.print("<script>location.replace('views/login.jsp');</script>");
    }
%>
</body>

</html>