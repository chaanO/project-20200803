package comment.model;

public class Comment {
	private int articleNo;
	private String writerName;
	private String password;
	private String message;
	private int commentNo;
	private String content;
	

	@Override
	public String toString() {
		return "Message [articleNo=" + articleNo + ", writerName=" + writerName + ", password=" + password + ", message=" + message
				+ "]";
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public int getCommentNo() {
		return commentNo;
	}
	
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public int getArticleNo() {
		return articleNo;
	}
	public void setArticleNo(int articleNo) {
		this.articleNo = articleNo;
	}
	public String getWriterName() {
		return writerName;
	}
	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	public boolean hasPassword() {
	return password != null && !password.isEmpty();
	}
	
	public boolean matchPassword(String pwd) {
		return password != null && password.equals(pwd);
	}


}
