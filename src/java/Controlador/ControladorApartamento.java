/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Apartamento;
import ModeloDAO.ApartamentoDAO;
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
@WebServlet(name = "ControladorApartamento", urlPatterns = {"/ControladorApartamento"})
public class ControladorApartamento extends HttpServlet {

    String listar="Reporte.jsp";
    String add="Residente_Informacion.jsp";
    String edit="Residente_Informacion.jsp";
    Apartamento a=new Apartamento();
    ApartamentoDAO adao=new ApartamentoDAO();
    int id, per, mas, tel;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorApartamento</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorApartamento at " + request.getContextPath() + "</h1>");
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
            String apa=request.getParameter("txtApa");
            String due=request.getParameter("txtDue");
            per=Integer.parseInt(request.getParameter("txtPer"));
            mas=Integer.parseInt(request.getParameter("txtMas"));
            tel=Integer.parseInt(request.getParameter("txtTel"));
            a.setApa(apa);
            a.setDue(due);
            a.setPer(per);
            a.setMas(mas);
            a.setTel(tel);
            adao.add(a);
            acceso=add;
        }
        else if(action.equalsIgnoreCase("editar")){
            request.setAttribute("idapa",request.getParameter("id"));
            acceso=edit;
        }
        else if(action.equalsIgnoreCase("Actualizar")){
            id=Integer.parseInt(request.getParameter("txtid"));
            String apa=request.getParameter("txtApa");
            String due=request.getParameter("txtDue");
            per=Integer.parseInt(request.getParameter("txtPer"));
            mas=Integer.parseInt(request.getParameter("txtMas"));
            tel=Integer.parseInt(request.getParameter("txtTel"));
            a.setId(id);
            a.setApa(apa);
            a.setDue(due);
            a.setPer(per);
            a.setMas(mas);
            a.setTel(tel);
            adao.edit(a);
            acceso=listar;
        }
        else if(action.equalsIgnoreCase("eliminar")){
            id=Integer.parseInt(request.getParameter("id"));
            a.setId(id);
            adao.eliminar(id);
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
