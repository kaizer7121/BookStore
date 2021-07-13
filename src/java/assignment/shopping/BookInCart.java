/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package assignment.shopping;

/**
 *
 * @author Kaizer
 */
public class BookInCart {
    private BookDTO book;
    private int amount;

    public BookInCart(BookDTO book, int amount) {
        this.book = book;
        this.amount = amount;
    }

    public BookInCart() {
    }

    public BookDTO getBook() {
        return book;
    }

    public void setBook(BookDTO book) {
        this.book = book;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
    
    
}
