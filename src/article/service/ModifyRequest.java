package article.service;

import java.util.Map;

public class ModifyRequest {
	private String userId;
	private int articleNumber;
	private String title;
	private String content;
	private String userName;
	

	public ModifyRequest(String userId, int articleNumber, String title, String content, String userName) {
		this.userId = userId;
		this.articleNumber = articleNumber;
		this.title = title;
		this.content = content;
		this.userName = userName;
	}
	public String getUserName() {
		return userName;
	}

	public String getUserId() {
		return userId;
	}

	public int getArticleNumber() {
		return articleNumber;
	}

	public String getTitle() {
		return title;
	}

	public String getContent() {
		return content;
	}
	
	public void validate(Map<String, Boolean> errors) {
		if(title == null || title.trim().isEmpty()) {
			errors.put("title", Boolean.TRUE);
		}
	}
}
