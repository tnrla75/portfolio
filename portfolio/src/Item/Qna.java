package Item;

import java.sql.Date;

public class Qna {
	private int qnaNo;
	private String mb_id;
	private String itemCode;
	private String qsubject;
	private String question;
	private Date qupdate;
	private String qanswer;
	
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	public String getItemCode() {
		return itemCode;
	}
	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}
	public String getQsubject() {
		return qsubject;
	}
	public void setQsubject(String qSubject) {
		this.qsubject = qsubject;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public Date getQupdate() {
		return qupdate;
	}
	public void setQupdate(Date qUpdate) {
		this.qupdate = qUpdate;
	}
	public String getQanswer() {
		return qanswer;
	}
	public void setQanswer(String qAnswer) {
		this.qanswer = qanswer;
	}

	
}
