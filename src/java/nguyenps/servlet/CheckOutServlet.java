/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyenps.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import nguyenps.cart.CartDAO;
import nguyenps.cartitem.CartItemDAO;
import nguyenps.product.ProductDAO;
import nguyenps.product.ProductDTO;
import nguyenps.account.AccountDTO;


/**
 *
 * @author Admin
 */
@WebServlet(name = "CheckOutServlet", urlPatterns = {"/CheckOutServlet"})
public class CheckOutServlet extends HttpServlet {
    private final String SHOPING_DONE_PAGE = "doneShopping.jsp";
    private final String ERROR = "viewCart.jsp";
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
        String url = ERROR;
        try {
            ProductDAO dao = new ProductDAO();
            List<ProductDTO> list;
            list = dao.getAllProduct();
            HttpSession session = request.getSession(false);
            if (session != null) {
                CartDAO cart = (CartDAO) session.getAttribute("CART");
                if(cart != null) {
                    Map<Integer, Integer> hashMap = cart.getItems();
                    if(hashMap != null) {
                        float total = (float)session.getAttribute("TOTAL_AMOUNT");
                        AccountDTO user = (AccountDTO)session.getAttribute("USER");
                        int userID = user.getId();
                        Timestamp date = Timestamp.valueOf(LocalDateTime.now());
                        int orderID = cart.saveCartToDatabase(total, userID, date);
                        if(orderID != 0) {
                            CartItemDAO cartDAO = new CartItemDAO();
                            for (Integer i : hashMap.keySet()) {
                                for (ProductDTO foodDTO : list) {
                                    if(i == foodDTO.getProductID()) {
                                        if(cartDAO.saveCartItemToDatabase(orderID, foodDTO.getProductID(), hashMap.get(i))){
                                            dao.updateQuantity(foodDTO.getProductID(), foodDTO.getQuantity() - hashMap.get(i));
                                            session.removeAttribute("CART");
                                            request.setAttribute("DONE_SHOPPING", "OK");
                                            url = SHOPING_DONE_PAGE;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        catch (SQLException ex) {
            //log("CheckOutServlet _ SQLException : " + ex.getMessage());
            ex.printStackTrace();
        } catch (NamingException ex) {
            log("CheckOutServlet _ NamingException : " + ex.getMessage());
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
