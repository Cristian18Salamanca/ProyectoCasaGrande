/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Residente;
import ModeloDAO.ResidenteDAO;
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
@WebServlet(name = "ControladorResidente", urlPatterns = {"/ControladorResidente"})
public class ControladorResidente extends HttpServlet {

    String listar="Censo.jsp";
    String add="Residente_Informacion.jsp";
    String edit="Censo.jsp";
    Residente r=new Residente();
    ResidenteDAO cdao=new ResidenteDAO();
    int id;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorResidente</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorResidente at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso="";
        String action=request.getParameter("accion");
        if(action.equalsIgnoreCase("listar")){
            acceso=listar;            
        }else if(action.equalsIgnoreCase("add")){
            
        }
        else if(action.equalsIgnoreCase("Agregar")){
            String apa=request.getParameter("txtApa");
            String ico=request.getParameter("txtIco");
            String fco=request.getParameter("txtFco");
            String tip=request.getParameter("txtTip");
            String arr=request.getParameter("txtArr");
            String veh=request.getParameter("txtVeh");
            r.setApa(apa);
            r.setIco(ico);
            r.setFco(fco);
            r.setTip(tip);
            r.setArr(arr);
            r.setVeh(veh);
            cdao.add(r);
            acceso=add;
        }
        else if(action.equalsIgnoreCase("editar")){
            request.setAttribute("idres",request.getParameter("id"));
            acceso=edit;
        }
        else if(action.equalsIgnoreCase("Actualizar")){
            id=Integer.parseInt(request.getParameter("txtid"));
            String apa=request.getParameter("txtApa");
            String ico=request.getParameter("txtIco");
            String fco=request.getParameter("txtFco");
            String tip=request.getParameter("txtTip");
            String arr=request.getParameter("txtArr");
            String veh=request.getParameter("txtVeh");
            r.setId(id);
            r.setApa(apa);
            r.setIco(ico);
            r.setFco(fco);
            r.setTip(tip);
            r.setArr(arr);
            r.setVeh(veh);
            cdao.edit(r);
            acceso=listar;
        }
        else if(action.equalsIgnoreCase("eliminar")){
            id=Integer.parseInt(request.getParameter("id"));
            r.setId(id);
            cdao.eliminar(id);
            acceso=listar;
        }
        RequestDispatcher vista=request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
