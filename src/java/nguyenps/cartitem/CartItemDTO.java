/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyenps.cartitem;

import java.io.Serializable;

/**
 *
 * @author Admin
 */
public class CartItemDTO implements Serializable{
    private int id;
    private int cartID;
    private int foodID;
    private float quantity;

    public CartItemDTO() {
    }

    public CartItemDTO(int cartID, int foodID, float quantity) {
        this.cartID = cartID;
        this.foodID = foodID;
        this.quantity = quantity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCartID() {
        return cartID;
    }

    public void setCartID(int cartID) {
        this.cartID = cartID;
    }

    public int getFoodID() {
        return foodID;
    }

    public void setFoodID(int foodID) {
        this.foodID = foodID;
    }

    public float getQuantity() {
        return quantity;
    }

    public void setQuantity(float quantity) {
        this.quantity = quantity;
    }
    
    
}
