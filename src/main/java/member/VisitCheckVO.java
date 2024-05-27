package member;

public class VisitCheckVO {
	private int idx;
	private String mid;
	private String nickName;
	private String content;
	private String checkDate;
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCheckDate() {
		return checkDate;
	}
	public void setCheckDate(String checkDate) {
		this.checkDate = checkDate;
	}
	@Override
	public String toString() {
		return "VisitCheckVO [idx=" + idx + ", mid=" + mid + ", nickName=" + nickName + ", content=" + content
				+ ", checkDate=" + checkDate + "]";
	}

	
	

	
	
	
}
