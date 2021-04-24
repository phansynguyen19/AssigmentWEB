/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyenps.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import nguyenps.account.AccountDAO;
import nguyenps.account.AccountDTO;

/**
 *
 * @author Admin
 */
public class LoginServlet extends HttpServlet {
    private final String INVALID_PAGE = "login1.jsp";
    private final String SEARCH_PAGE = "index.jsp";
    private final String ADMIN_PAGE = "admin_page.jsp";
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
        String url = INVALID_PAGE;
        try {
            String username = request.getParameter("txtUsername");
            String password = request.getParameter("txtPassword");
            String page = request.getParameter("page");
            
            AccountDAO dao = new AccountDAO();
            AccountDTO user = dao.checkLogin(username, password);
            if (user != null) {
                
                HttpSession session = request.getSession();
                session.setAttribute("USER", user);
                if(user.isRole() == false) {
                    url = SEARCH_PAGE;
                } else {
                    url = ADMIN_PAGE;
                }
                if(page.equals("search")) {
                    String searchValue = request.getParameter("searchValue");
                    url = "SearchServlet?txtSearchValue="+searchValue;
                }
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("INVALID_USER", "Username or password incorect");
            }
        } catch (SQLException ex) {
            log("LoginServlet _ SQLException : " + ex.getMessage());
        } catch (NamingException ex) {
            log("LoginServlet _ NamingException : " + ex.getMessage());
        } finally {
            response.sendRedirect(url);
//            RequestDispatcher rd = request.getRequestDispatcher(url);
//            rd.forward(request, response);
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
