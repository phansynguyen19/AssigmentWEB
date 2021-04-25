/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyenps.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
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
@WebServlet(name = "UpdateCartServlet", urlPatterns = {"/UpdateCartServlet"})
public class UpdateCartServlet extends HttpServlet {
    private final String VIEW_CART = "ViewCartServlet";
    private final String ERROR = "login1.jsp";
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
        
        String[] quantity = request.getParameterValues("txtQuantity");
        String[] title = request.getParameterValues("ID");
        String url = ERROR;
        try {
            ProductDAO dao = new ProductDAO();
            List<ProductDTO> list;
            list = dao.getAllProduct();
            HttpSession session = request.getSession(false);
            if (session.getAttribute("USER") != null) {
                CartDAO cart = (CartDAO) session.getAttribute("CART");
                
                for (int i = 0; i < quantity.length; i++) {
                    if(Integer.parseInt(quantity[i]) <= 0) {
                        request.setAttribute("ERROR_UPDATE_QUANTITY", "Input error or empty quantity!!!");
                    }
                    else {
                        for (ProductDTO foodDTO : list) {
                            if(Integer.parseInt(title[i]) == foodDTO.getProductID()) {
                                if(Integer.parseInt(quantity[i]) > foodDTO.getQuantity()) {
                                    request.setAttribute("ERROR_UPDATE", foodDTO.getProductName());
                                } else {
                                    cart.updateItemToCart(Integer.parseInt(title[i]), Integer.parseInt(quantity[i]));
                                }
                            }
                        }
                    }
                }
                session.setAttribute("CART", cart);
                url = VIEW_CART;
            }
        }
        catch (SQLException ex) {
            Logger.getLogger(ViewCartServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(ViewCartServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        catch (NumberFormatException ex) {
            request.setAttribute("ERROR_UPDATE_QUANTITY", "Input error or empty quantity!!!");
            url = VIEW_CART;
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
