package member;

public class MsgVO {
	
	private int idx;
	private String sendMid;
	private String receiveMid;
	private String sDate;
	private String message;
	private String isRead;
	private String checked;
	
	private int hereCnt;
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getSendMid() {
		return sendMid;
	}
	public void setSendMid(String sendMid) {
		this.sendMid = sendMid;
	}
	public String getReceiveMid() {
		return receiveMid;
	}
	public void setReceiveMid(String receiveMid) {
		this.receiveMid = receiveMid;
	}
	public String getsDate() {
		return sDate;
	}
	public void setsDate(String sDate) {
		this.sDate = sDate;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getIsRead() {
		return isRead;
	}
	public void setIsRead(String isRead) {
		this.isRead = isRead;
	}
	public String getChecked() {
		return checked;
	}
	public void setChecked(String checked) {
		this.checked = checked;
	}
	
	public int getHereCnt() {
		return hereCnt;
	}
	public void setHereCnt(int hereCnt) {
		this.hereCnt = hereCnt;
	}
	
	
	@Override
	public String toString() {
		return "MsgVO [idx=" + idx + ", sendMid=" + sendMid + ", receiveMid=" + receiveMid + ", sDate=" + sDate
				+ ", message=" + message + ", isRead=" + isRead + ", checked=" + checked + ", hereCnt=" + hereCnt + "]";
	}
	
	

		
	
}
