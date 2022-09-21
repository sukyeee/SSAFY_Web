package board.dto;

import java.util.Date;

public class BoardDto_me {
    private int boardId;
    private int userSeq;
    private String title;
    private String content;
    private Date boardRegisterDate;
    private int boardReadCount;
    
	public int getBoardId() {
		return boardId;
	}
	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}
	public int getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getBoardRegisterDate() {
		return boardRegisterDate;
	}
	public void setBoardRegisterDate(Date boardRegisterDate) {
		this.boardRegisterDate = boardRegisterDate;
	}
	public int getBoardReadCount() {
		return boardReadCount;
	}
	public void setBoardReadCount(int boardReadCount) {
		this.boardReadCount = boardReadCount;
	}

    
    
}