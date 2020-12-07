/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Multa;
import ModeloDAO.MultasDAO;
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
@WebServlet(name = "ControladorMulta", urlPatterns = {"/ControladorMulta"})
public class ControladorMulta extends HttpServlet {

    String listar="Multas_Info.jsp";
    String add="Multas_Info.jsp";
    String edit="Multas_Info.jsp";
    Multa m=new Multa();
    MultasDAO dao=new MultasDAO();
    int id;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorMulta</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorMulta at " + request.getContextPath() + "</h1>");
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
            String pla=request.getParameter("txtPla");
            String veh=request.getParameter("txtVeh");
            String fec=request.getParameter("txtFec");
            m.setPla(pla);
            m.setVeh(veh);
            m.setFec(fec);
            dao.add(m);
            acceso=listar;
        }
        else if(action.equalsIgnoreCase("editar")){
            request.setAttribute("idmul",request.getParameter("id"));
            acceso=edit;
        }
        else if(action.equalsIgnoreCase("Actualizar")){
            id=Integer.parseInt(request.getParameter("txtid"));
            String pla=request.getParameter("txtPla");
            String veh=request.getParameter("txtVeh");
            String fec=request.getParameter("txtFec");
            m.setId(id);
            m.setPla(pla);
            m.setVeh(veh);
            m.setFec(fec);
            dao.edit(m);
            acceso=listar;
        }
        else if(action.equalsIgnoreCase("eliminar")){
            id=Integer.parseInt(request.getParameter("id"));
            m.setId(id);
            dao.eliminar(id);
            acceso=listar;
        }
        else if(action.equalsIgnoreCase("cancelar")){
            id=Integer.parseInt(request.getParameter("id"));
            m.setId(id);
            dao.cancelar(id);
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

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
