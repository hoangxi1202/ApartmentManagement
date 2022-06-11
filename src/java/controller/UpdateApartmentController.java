/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ApartmentDAO;
import dao.ApartmentError;
import dto.ApartmentDTO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Trieu Do
 */
@WebServlet(name = "UpdateApartmentController", urlPatterns = {"/UpdateApartmentController"})
public class UpdateApartmentController extends HttpServlet {

    private static final String ERROR = "MainController?action=SearchApartment&search=";
    private static final String SUCCESS = "MainController?action=SearchApartment&search=";
//    private static final String ERROR = "SearchApartmentController";
//    private static final String SUCCESS = "SearchApartmentController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        ApartmentError apartmentError = new ApartmentError();
        try {
            boolean checkValidation = true;
            String apartmentId = request.getParameter("apartmentId");
            String size = request.getParameter("size");
            String details = request.getParameter("details");
            String buildingName = request.getParameter("buildingName");
            float rentPrice = Float.parseFloat(request.getParameter("rentPrice"));
            float salePrice = Float.parseFloat(request.getParameter("salePrice"));
            String status = request.getParameter("status");
            ApartmentDTO apartment = new ApartmentDTO(apartmentId, size, details, buildingName, rentPrice, salePrice, status);
            ApartmentDAO dao = new ApartmentDAO();
            if (checkValidation) {
                if (dao.updateApartment(apartment)) {
                    url = SUCCESS;
                }
            } else {
                request.setAttribute("APARTMENT_ERROR", apartmentError);
            }
        } catch (Exception e) {
            log("Error at UpdateController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
        processRequest(request, response);
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
