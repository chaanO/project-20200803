package cart.service;

import java.util.List;

import cart.model.Cart;

public class CartPage {
	private int total;
	private int currentPage;
	private List<Cart> cartList;
	private int totalPages;
	private int startPage;
	private int endPage;
	
	public CartPage(int total, int currentPage, int size, List<Cart> cartList) {
		this.total = total;
		this.currentPage = currentPage;
		this.cartList = cartList;
		
		if (total == 0) {
			totalPages = 0;
			startPage = 0;
			endPage = 0;
		} else {
			totalPages = total / size;
			if (total % size > 0) {
				totalPages++;
			}
			int modVal = currentPage % 5;
			startPage = currentPage / 5 * 5 + 1;
			if (modVal == 0) {
				startPage -= 5;
			}
			endPage = startPage + 4;
			if (endPage > totalPages) {
				endPage = totalPages;
			}
		}
	}

	public int getTotal() {
		return total;
	}
	
	public boolean hasNoCarts() {
		return total == 0;
	}
	
	public boolean hasCarts() {
		return total > 0;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}

	public List<Cart> getCartList() {
		return cartList;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}
}
