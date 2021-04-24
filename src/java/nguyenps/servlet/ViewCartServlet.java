/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyenps.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import nguyenps.cart.CartDAO;
import nguyenps.product.ProductDAO;
import nguyenps.product.ProductDTO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ViewCartServlet", urlPatterns = {"/ViewCartServlet"})
public class ViewCartServlet extends HttpServlet {
    private final String VIEW_CART = "viewCart.jsp";
    private final String ERROR = "error.html";
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
        float sum = 0;
        String url = VIEW_CART;
        try {
            HttpSession session = request.getSession(false);
            if (session != null) {
                ProductDAO dao = new ProductDAO();
                List<ProductDTO> list;
                list = dao.getAllProduct();
                CartDAO cart = (CartDAO) session.getAttribute("CART");
                if(cart != null) {
                    Map<Integer, Integer> hashMap = cart.getItems();
                    if(hashMap != null) {
                        for (Integer integer : hashMap.keySet()) {
                            for (ProductDTO foodDTO : list) {
                                if(foodDTO.getProductID() == integer) {
                                    sum += (foodDTO.getPrice() * hashMap.get(integer));
                                }
                            }
                        }
                    }
                    session.setAttribute("TOTAL_AMOUNT", sum);
                    url = VIEW_CART;
                }
                else {
                    session.setAttribute("TOTAL_AMOUNT", 0);
                }
            }
        }catch (SQLException ex) {
            Logger.getLogger(ViewCartServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(ViewCartServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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
