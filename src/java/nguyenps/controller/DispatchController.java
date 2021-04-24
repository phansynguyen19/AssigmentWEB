/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyenps.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



/**
 *
 * @author Admin
 */
@WebServlet(name = "DispatchController", urlPatterns = {"/DispatchController"})
public class DispatchController extends HttpServlet {
    private final String LOGIN_PAGE = "login1.jsp";
    private final String LOGIN_CONTROLLER = "LoginServlet";
    private final String SEARCH_ALL = "SearchAllFoodServlet";
    private final String CREATE_NEW_ACCOUNT = "CreateNewAccountServlet";
    private final String ADD_TO_CART = "AddItemToCartServlet";
    private final String VIEW_CART = "ViewCartServlet";
    private final String DELETE_ITEM = "DeleteItemServlet";
    private final String UPDATE_CART_SERVLET = "UpdateCartServlet";
    private final String LOGOUT_SERVLET = "LogoutServlet";
    private final String CHECKOUT_SERVLET = "CheckOutServlet";
    private final String SEARCH_SERVLET = "SearchServlet";
    

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String url = LOGIN_PAGE;
        String button = request.getParameter("btAction");
        try {
            if(button == null) {
                url = SEARCH_ALL;
            }
            else if (button.equals("Login")) {
                url = LOGIN_CONTROLLER;
            }
            else if (button.equals("Logout")) {
                url = LOGOUT_SERVLET;
            }
            else if (button.equals("CheckOut")) {
                url = CHECKOUT_SERVLET;
            }
            else if (button.equals("UpdateCart")) {
                url = UPDATE_CART_SERVLET;
            }
            else if (button.equals("DeleteItemLink")) {
                url = DELETE_ITEM;
            }
            else if (button.equals("viewCart")) {
                HttpSession session = request.getSession();
                if(session.getAttribute("USER") == null) {
                    url = LOGIN_PAGE;
                } else {
                    url = VIEW_CART;
                }
                
            }
            else if (button.equals("AddToCart")) {
                HttpSession session = request.getSession();
                if(session.getAttribute("USER") == null) {
                    url = LOGIN_PAGE;
                } else {
                    url = ADD_TO_CART;
                }
            }
            else if (button.equals("Create New Account")) {
                url = CREATE_NEW_ACCOUNT;
            }
            else if (button.equals("Search")) {
                url = SEARCH_SERVLET;
            }

        }
        finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
//            response.sendRedirect(url);
            out.close();
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
