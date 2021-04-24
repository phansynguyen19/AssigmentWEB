/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyenps.product;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author Admin
 */
public class ProductDTO implements Serializable{
    private int productID;
    private String productName;
    private String image;
    private String description;
    private float price;
    private Date createDate;
    private int categoryID;
    private int quantity;
    private boolean status;

    public ProductDTO() {
    }

    public ProductDTO(int productID, String productName, String image, String description, float price, Date createDate, int categoryID, int quantity, boolean status) {
        this.productID = productID;
        this.productName = productName;
        this.image = image;
        this.description = description;
        this.price = price;
        this.createDate = createDate;
        this.categoryID = categoryID;
        this.quantity = quantity;
        this.status = status;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    
    
    
}
