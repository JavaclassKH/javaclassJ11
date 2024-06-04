package infos;

public class InfosVO {
	private String IVEName;
	private String photo;
	private String positions;
	private String nickNames;
	private String mbti;
	private String introduce;
	
	
	public String getIVEName() {
		return IVEName;
	}
	public void setIVEName(String iVEName) {
		IVEName = iVEName;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getPositions() {
		return positions;
	}
	public void setPositions(String positions) {
		this.positions = positions;
	}
	public String getNickNames() {
		return nickNames;
	}
	public void setNickNames(String nickNames) {
		this.nickNames = nickNames;
	}
	public String getMbti() {
		return mbti;
	}
	public void setMbti(String mbti) {
		this.mbti = mbti;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	
	
	@Override
	public String toString() {
		return "IntroduceIVEVO [IVEName=" + IVEName + ", photo=" + photo + ", positions=" + positions + ", nickNames="
				+ nickNames + ", mbti=" + mbti + ", introduce=" + introduce + "]";
	}
		

}
