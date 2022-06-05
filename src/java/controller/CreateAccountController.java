/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import dao.UserDAO;
import dto.UserDTO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Minh Hoàng
 */
public class CreateAccountController extends HttpServlet {

    private static final String ERROR = "createUser.jsp";
    private static final String SUCCESS = "login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String userID = request.getParameter("userName");
            String fullName = request.getParameter("email");
//            String roleID = request.getParameter("roleID");
            String roleID = "US";
            String password = request.getParameter("password");
            boolean check = true;
//            UserError userError = new UserError();
//            if (userID.length() > 10 || userID.length() < 5) {
//                userError.setUserIDError("UserID length must be in [5,10]");
//                check = false;
//            }
//            if (fullName.length() > 50 || fullName.length() < 5) {
//                userError.setFullNameError("Full Name length must be in [5,50]");
//                check = false;
//            }
//            if (roleID.length() > 5 || roleID.length() < 2) {
//                userError.setRoleIDError("UserID length must be in [2,5]");
//                check = false;
//            }
//            if (!password.equals(confirm)) {
//                userError.setConfirmError("2 password ko trung");
//                check = false;
//            }
            if (check) {
                UserDAO dao = new UserDAO();
                UserDTO user = new UserDTO(userID, fullName, roleID, password);
//                boolean checkDuplicate = dao.checkDuplicate(userID);
//                if (checkDuplicate) {
//                    userError.setUserIDError("Duplicate UserID " + userID + " !");
//                    request.setAttribute("USER_ERROR", userError);
//                } else {
                    boolean checkInsert = dao.insertUser(user);
//                    if (checkInsert) {
                        url = SUCCESS;
//                    } else {
//                        userError.setMessageError("Cannot insert, unknow error!");
//                        request.setAttribute("USER_ERROR", userError);
//                    }
//                }
            }
//            } else {
//                request.setAttribute("USER_ERROR", userError);
//            }
        } catch (Exception e) {
            log("Error at createController" + e.toString());
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
