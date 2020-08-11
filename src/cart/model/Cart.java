package cart.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Cart {
	private Product product;
	private int cartId;
	private int bookId;
	private int amount;
	private String memberId;
	private Date regDate;
	
	public Cart(Product product, int bookId, int amount, String memberId, Date regDate) {
		this.product = product;
		this.bookId = bookId;
		this.amount = amount;
		this.memberId = memberId;
		this.regDate = regDate;
	}

	public Product getProduct() {
		return product;
	}

	public int getCartId() {
		return cartId;
	}
	
	public int getBookId() {
		return bookId;
	}
	
	public int getAmount() {
		return amount;
	}
	
	public String getMemberId() {
		return memberId;
	}
	
	public Date getRegDate() {
		return regDate;
	}
	
	// �궇吏� �삎�떇
	public String getRegDateCustom() {
		return new SimpleDateFormat("yyyy-MM-dd HH:mm").format(regDate);
	}
}
