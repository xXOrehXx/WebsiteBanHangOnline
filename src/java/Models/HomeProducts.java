/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Admin
 */
public class HomeProducts extends Products {

    String inCart;

    public HomeProducts() {
    }

    public HomeProducts(String inCart, String id, String name, String price, String image, String description, String category) {
        super(id, name, price, image, description, category);
        this.inCart = inCart;
    }

    public String getInCart() {
        return inCart;
    }

    public void setInCart(String inCart) {
        this.inCart = inCart;
    }
}
