/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package assignment.shopping;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Kaizer
 */
public class Cart {

    private Map<String, BookInCart> cart;

    public Cart() {
    }

    public Cart(Map<String, BookInCart> cart) {
        this.cart = cart;
    }

    public Map<String, BookInCart> getCart() {
        return cart;
    }

    public void setCart(Map<String, BookInCart> cart) {
        this.cart = cart;
    }

    public void addBook(BookDTO newBook, int amount) {
        if (this.cart == null) {
            this.cart = new HashMap<>();
        }
        String bookID = newBook.getProductID();
        if (this.cart.containsKey(bookID)) {
            int currentAmount = this.cart.get(bookID).getAmount();
            amount = amount + currentAmount;
        }
        BookInCart bookInCart = new BookInCart(newBook, amount);
        this.cart.put(bookID, bookInCart);
    }

    public void deleteBook(String bookID) {
        if (this.cart != null) {
            if (this.cart.containsKey(bookID)) {
                this.cart.remove(bookID);
            }
        }
    }

    public void updateAmountOfBook(String bookID, int amount) {
        if (this.cart != null) {
            if (this.cart.containsKey(bookID)) {
                BookInCart bookInCart = this.cart.get(bookID);
                bookInCart.setAmount(amount);
                this.cart.put(bookID, bookInCart);
            }
        }
    }

}
