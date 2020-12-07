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
    <!-- DataTables -->
        <link href="plugins/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css" />
        <link href="plugins/datatables/buttons.bootstrap4.min.css" rel="stylesheet" type="text/css" />

        <!-- Responsive datatable examples -->
        <link href="plugins/datatables/responsive.bootstrap4.min.css" rel="stylesheet" type="text/css" />

        <link href="Residente_Assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="Residente_Assets/css/metismenu.min.css" rel="stylesheet" type="text/css">
        <link href="Residente_Assets/css/icons.css" rel="stylesheet" type="text/css">
        <link href="Residente_Assets/css/style.css" rel="stylesheet" type="text/css">

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
                                            String qry1="select Nombre, Apellido, Telefono, Correo, Nombre_Usuario, Apartamento, Id_Usuario from usuario where Nombre_Usuario='" + usuario +"'";
                                            ResultSet data1 = sql1.executeQuery(qry1);
                                            while(data1.next()){
                                        %>
                                        <img src="Residente_Assets/images/users/iconuser.jpg" alt="user" class="rounded-circle"><span class="ml-1 pro-user-name"><% out.print(data1.getString(1));%><i class="mdi mdi-chevron-down"></i> </span>
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
        <div class="content">
                    <div class="container-fluid">
                        <div class="page-title-box">
                            <div class="row align-items-center">
                                <div class="col-sm-6">
                                <h4 class="page-title">Conjunto Residencial Casa Grande - Perfil de Usuario</h4>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-right">
                                    <li class="breadcrumb-item"><a href="javascript:void(0);">Casa Grande</a></li>
                                    <li class="breadcrumb-item active">Perfil de Usuario</li>
                                </ol>
                            </div>
                            </div> <!-- end row -->
                        </div>
                        <!-- end page-title -->
                        
                    <div class="row">
                            <div class="col-lg-4">
                                <div class="card m-b-30">
                                    <div class="card-body">
                                        <div class="faq-icon float-right">
                                             <button type="submit" class="btn btn-primary waves-effect waves-light" data-toggle="modal" data-target=".bs-example-modal-center" href="ControladorParqueadero?accion=editar&id=<% out.print(data1.getString(7));%>">Editar <i class="fas fa-pencil-alt"></i></button>
                                        </div>
                                        <h4 class="mt-0 header-title">CASA GRANDE - Detalles de Usuario</h4><br>
                                        <br>
                                        Señor(@) <% out.print(data1.getString(1));%> perteneces a nuestra magnifica comunidad de Usuarios los cuales 
                                        cuentan con acceso a la plataforma digital del Conjunto Residencial Casa Grande. Por favor realiza un uso 
                                        moderado de nuestro sitio web de lo contrario se eliminara el usuario y se deberá pagar cierto dinero para 
                                        su activación, gracias por contar con nosotros y por hacer de este sitio un espacio de libre convivencia y 
                                        respeto. A continuación encontraras todos tus datos, actualizarlos en los momentos que tú como usuarios 
                                        veas necesario.
                                        <br><br>
                                        Nombre de Usuario : <% out.print(data1.getString(5));%><br><br>
                                        Nombres : <% out.print(data1.getString(1));%><br><br>
                                        Apellidos : <% out.print(data1.getString(2));%><br><br>
                                        Correo : <% out.print(data1.getString(4));%><br><br>                                        
                                        Teléfono : <% out.print(data1.getString(3));%><br><br>
                                        <div class="faq-icon float-right">
                                             <button type="submit" class="btn btn-warning waves-effect waves-light" data-toggle="modal" data-target=".bs-example-modals-center" href="ControladorParqueadero?accion=editar&id=<% out.print(data1.getString(7));%>"><i class="fas fa-lock-open"></i></button>
                                        </div>
                                        Apartamento : <% out.print(data1.getString(6));%><br><br>
                                        
                                    </div>
                                </div>
                            </div>
    <div class="modal fade bs-example-modals-center" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
                         <div class="modal-dialog modal-dialog-centered">
                             <div class="modal-content">
                                 <div class="modal-header">
                                     <h5 class="modal-title mt-0">Casa Grande - Cambio de Contraseña</h5>
                                     <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                         <span aria-hidden="true">&times;</span>
                                     </button>
                                 </div>
                                 <div class="modal-body">
                                     <form action="ControladorUsuario">
                                         
                                <div class="form-group">
                                    <label>Escribe tu Contraseña Nueva:</label>
                                    <input type="password" name="txtCon" id="con" class="form-control" placeholder="Escribe tu nueva Contraseña" pattern="[A-Za-z0-9!?-]{8,12}" title="Contraseña Insegura - Minimo 8 caracteres, maximo 12" minlength="8" maxlength="12" required="required"/>
                                </div>
                                <div class="form-group">
                                    <label>Vuelve a Escribir tu Contraseña:</label>
                                    <input type="password" name="Contxt" id="con1" onkeyup="Habilitar('')" class="form-control" placeholder="Confirmar Contraseña" pattern="[A-Za-z0-9!?-]{8,12}" title="Contraseña Insegura - Minimo 8 caracteres, maximo 12" minlength="8" maxlength="12" required="required"/>
                                </div>                                
                            <div class="form-group">
                            <div>
                            <button type="submit" id="boton" class="btn btn-primary waves-effect waves-light"><input type="hidden" name="txtid" value="<% out.print(data1.getString(7));%>"><input class="btn btn-primary" type="hidden" name="accion" value="Actualizarc">Cambiar</button>
                            <button type="reset" class="btn btn-secondary waves-effect m-l-5" data-dismiss="modal" aria-label="Close">Cancelar</button>
                            
                            </div>
                            </div>
                            </form>
                                 </div>
                             </div><!-- /.modal-content -->
                         </div><!-- /.modal-dialog -->
                     </div>
                            <script type="text/javascript">
                            function Habilitar(){
                                var con1 = document.getElementById('con');
                                var con2 = document.getElementById('con1');
                                var boton = document.getElementById('boton');
                                if (con1.value !== con2.value){
                                    boton.disabled = true;
                                } else {
                                    boton.disabled = false;
                                }
                            }
                            </script> 
    <div class="modal fade bs-example-modal-center" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
                         <div class="modal-dialog modal-dialog-centered">
                             <div class="modal-content">
                                 <div class="modal-header">
                                     <h5 class="modal-title mt-0">Casa Grande - Editar Usuario</h5>
                                     <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                         <span aria-hidden="true">&times;</span>
                                     </button>
                                 </div>
                                 <div class="modal-body">
                                     <form action="ControladorUsuario">
                                         
                                <div class="form-group">
                                    <label>Nombre de Usuario:</label>
                                    <input type="text" name="txtNus" class="form-control" value="<% out.print(data1.getString(5));%>" readonly="readonly"/>
                                </div>
                                <div class="form-group">
                                    <label>Nombres:</label>
                                    <input type="text" name="txtNom" class="form-control" value="<% out.print(data1.getString(1));%>"/>
                                </div>
                                <div class="form-group">
                                    <label>Apellido:</label>
                                    <input type="text" name="txtApe" class="form-control" value="<% out.print(data1.getString(2));%>"/>
                                </div>
                                <div class="form-group">
                                    <label>Correo:</label>
                                    <input type="text" name="txtCor" class="form-control" value="<% out.print(data1.getString(4));%>"/>
                                </div>
                                <div class="form-group">
                                    <label>Teléfono:</label>
                                    <input type="text" name="txtTel" class="form-control" value="<% out.print(data1.getString(3));%>"/>
                                </div>
                                
                            <div class="form-group">
                            <div>
                            <button type="submit" class="btn btn-primary waves-effect waves-light"><input type="hidden" name="txtid" value="<% out.print(data1.getString(7));%>"><input class="btn btn-primary" type="hidden" name="accion" value="Actualizar">Editar</button>
                            <button type="reset" class="btn btn-secondary waves-effect m-l-5" data-dismiss="modal" aria-label="Close">Cancelar</button>
                            </div>
                            </div>
                            </form>
                                 </div>
                             </div><!-- /.modal-content -->
                         </div><!-- /.modal-dialog --><% } %>
                     </div>
                            <div class="col-lg-8">
                                <div class="card m-b-30">
                                    <div class="card-body">        
                                        <div class="">
                                            <img src="Residente_Assets/images/small/img-12.jpg" class="img-fluid" alt="Responsive image">
                                        </div>
                                    </div>
                                </div>
                            </div>
        
                        </div>
                    <div class="row">
                            <div class="col-xl-12">
                                <div class="card m-b-30">
                                    
                                    <div class="card-body">
                                        <div class="faq-icon float-right">
                                        <div class="spinner-grow text-success" role="status">
                                            <span class="sr-only">Loading...</span>
                                        </div>
                                        <div class="spinner-grow text-warning" role="status">
                                            <span class="sr-only">Loading...</span>
                                        </div>
                                        <div class="spinner-grow text-info" role="status">
                                            <span class="sr-only">Loading...</span>
                                        </div>
                                        </div>
                                        <h4 class="mt-0 header-title">Casa Grande - Personas Inhabilitadas</h4><br>
                                                
                                        <table id="datatable" class="table table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                            <thead>
                                            <tr>
                                                <th>Apartamento</th>
                                                <th>Nombres</th>
                                                <th>Apellidos</th>
                                                <th>Fecha de Nacimiento</th>
                                                <th>Teléfono </th>
                                                <th>Acción </th>
                                            </tr>
                                            </thead>
                                    <% 
                                        Connection conn2 = 
                                            DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto_casagrande", 
                                                "root", "");
                                        Statement sql3 = conn2.createStatement();
                                        String qry3="SELECT a.id_persona, a.nombres, a.apellidos, a.nacimiento, a.telefono, a.apartamento FROM personas_inhabilitadas as a INNER JOIN usuario as u ON a.apartamento = u.apartamento WHERE u.Nombre_Usuario = '" + usuario +"' and MONTH(a.fecha)=MONTH(CURDATE())";
                                        ResultSet data3 = sql3.executeQuery(qry3);
                                        while(data3.next()){
                                    %>
                                        <tbody>
                                        <tr>
                                            <td><% out.print(data3.getString(6));%></td>
                                            <td><% out.print(data3.getString(2));%></td>
                                            <td><% out.print(data3.getString(3));%></td>
                                            <td><% out.print(data3.getString(4));%></td>
                                            <td><% out.print(data3.getString(5));%></td>                     
                                            <td>
                                                <a type="button" class="btn btn-success btn-sm waves-effect waves-light" href="ControladorPersonaInha?accion=eliminar&id=<% out.print(data3.getString(1));%>">Recuperar</a>
                                            </td>
                                        </tr>
                                                                                     
                                            </tbody><% } %>
                                        </table>
        
                                    </div>
                                </div>
                            </div> <!-- end col -->
                            
                        </div> <!-- end row -->
                    </div>
                    <!-- container-fluid -->

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

    <!--Morris Chart-->
    <script src="plugins/morris/morris.min.js"></script>
    <script src="plugins/raphael/raphael.min.js"></script>
    <!-- Required datatable js -->
        <script src="plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="plugins/datatables/dataTables.bootstrap4.min.js"></script>
        <!-- Buttons examples -->
        <script src="plugins/datatables/dataTables.buttons.min.js"></script>
        <script src="plugins/datatables/buttons.bootstrap4.min.js"></script>
        <script src="plugins/datatables/jszip.min.js"></script>
        <script src="plugins/datatables/pdfmake.min.js"></script>
        <script src="plugins/datatables/vfs_fonts.js"></script>
        <script src="plugins/datatables/buttons.html5.min.js"></script>
        <script src="plugins/datatables/buttons.print.min.js"></script>
        <script src="plugins/datatables/buttons.colVis.min.js"></script>
        <!-- Responsive examples -->
        <script src="plugins/datatables/dataTables.responsive.min.js"></script>
        <script src="plugins/datatables/responsive.bootstrap4.min.js"></script>

        <!-- Datatable init js -->
        <script src="Residente_Assets/pages/datatables.init.js"></script>
    <script src="Residente_Assets/pages/dashboard.init.js"></script>

    <!-- App js -->
    <script src="Residente_Assets/js/app.js"></script>
<%
    }else{
       out.print("<script>location.replace('views/login.jsp');</script>");
    }
%>
</body>

</html>