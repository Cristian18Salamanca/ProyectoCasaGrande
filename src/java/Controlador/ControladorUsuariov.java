/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Usuario;
import ModeloDAO.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author crist
 */
@WebServlet(name = "ControladorUsuariov", urlPatterns = {"/ControladorUsuariov"})
public class ControladorUsuariov extends HttpServlet {

    String ini="index.html";
    String listar="PerfilVigilante.jsp";
    String add="registrarUsuario.jsp";
    String edit="vistas/editUsuario.jsp";
    Usuario u=new Usuario();
    UsuarioDAO dao=new UsuarioDAO();
    int id;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorUsuariov</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorUsuariov at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso="";
        String action=request.getParameter("accion");
        if(action.equalsIgnoreCase("listar")){
            acceso=listar;     
        }else if(action.equalsIgnoreCase("add")){
            acceso=add;
        }
        else if(action.equalsIgnoreCase("Agregar")){
            String nom=request.getParameter("txtNom");
            String ape=request.getParameter("txtApe");
            String tel=request.getParameter("txtTel");
            String cor=request.getParameter("txtCor");
            String tip=request.getParameter("txtTip");
            String apa=request.getParameter("txtApa");
            String nus=request.getParameter("txtNus");
            String con=request.getParameter("txtCon");
            u.setNom(nom);
            u.setApe(ape);
            u.setTel(tel);
            u.setCor(cor);
            u.setTip(tip);
            u.setApa(apa);
            u.setNus(nus);
            u.setCon(con);
            dao.add(u);
            acceso=add;
        }
        else if(action.equalsIgnoreCase("editar")){
            request.setAttribute("idusu",request.getParameter("id"));
            acceso=edit;
        }
        else if(action.equalsIgnoreCase("Actualizar")){
            id=Integer.parseInt(request.getParameter("txtid"));
            String nom=request.getParameter("txtNom");
            String ape=request.getParameter("txtApe");
            String tel=request.getParameter("txtTel");
            String cor=request.getParameter("txtCor");
            String tip=request.getParameter("txtTip");
            String apa=request.getParameter("txtApa");
            String nus=request.getParameter("txtNus");
            String con=request.getParameter("txtCon");
            u.setId(id);
            u.setNom(nom);
            u.setApe(ape);
            u.setTel(tel);
            u.setCor(cor);
            u.setTip(tip);
            u.setApa(apa);
            u.setNus(nus);
            u.setCon(con);
            dao.edit(u);
            acceso=listar;
        }
        
        else if(action.equalsIgnoreCase("Actualizarc")){
            id=Integer.parseInt(request.getParameter("txtid"));
            String con=request.getParameter("txtCon");
            u.setId(id);
            u.setCon(con);
            dao.contra(u);
            acceso=ini;
        }
        else if(action.equalsIgnoreCase("eliminar")){
            id=Integer.parseInt(request.getParameter("id"));
            u.setId(id);
            dao.eliminar(id);
            acceso=listar;
        }
        RequestDispatcher vista=request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
