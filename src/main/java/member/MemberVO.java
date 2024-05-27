package member;

public class MemberVO {
	private int idx;
	private String name;
	private String mid;
	private String pwd;
	private String nickName;
	private String contact;
	private String email;
	private String joinDate;
	private int visitCnt;
	private int memLevel;
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}
	public int getVisitCnt() {
		return visitCnt;
	}
	public void setVisitCnt(int visitCnt) {
		this.visitCnt = visitCnt;
	}
	public int getMemLevel() {
		return memLevel;
	}
	public void setMemLevel(int memLevel) {
		this.memLevel = memLevel;
	}
	
	
	@Override
	public String toString() {
		return "MemberVO [idx=" + idx + ", name=" + name + ", mid=" + mid + ", pwd=" + pwd + ", nickName=" + nickName
				+ ", contact=" + contact + ", email=" + email + ", joinDate=" + joinDate + ", visitCnt=" + visitCnt
				+ ", memLevel=" + memLevel + "]";
	}
	


	
	
}