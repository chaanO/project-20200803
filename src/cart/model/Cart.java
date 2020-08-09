package cart.model;

public class Cart {
	private int cartId;
	private int bookId;
	private int amount;
	private String memberId;
	
	public Cart(int bookId, int amount, String memberId) {
		this.bookId = bookId;
		this.amount = amount;
		this.memberId = memberId;
	}
	
	public int getCartId() {
		return cartId;
	}
	public void setCartId(int cartId) {
		this.cartId = cartId;
	}
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
}
