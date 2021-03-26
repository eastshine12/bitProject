package dto;

import java.io.Serializable;

public class MemberDto implements Serializable{
	private String memberID;				// 회원아이디
	private String pwd;						// 비밀번호
	private String email;					// 이메일
	private String name;					// 이름
	private String phoneNum;				// 전화번호
	private String gender;					// 성별
	private String trainerID;				// 트레이너 고유ID	Trainer table과 join
	private String profileImg; 				// 프로필 이미지
	private int age;						// 나이
	private double height;					// 키
	private double weight;					// 몸무게
	private int level;						// 점수
	private String badge;					// 배지를 전부 종합한것
	private String gymname;					// 헬스장이름(트레이너가 일하는곳)
	private String trainerContent;			// 트레이너 소개, 내용, 정보 
	private int memtype;					// 회원타입??
	private int count;
	
	
	
	public MemberDto(String memberID, String email, String name) {
		super();
		this.memberID = memberID;
		this.email = email;
		this.name = name;
	}
	public String getMemberID() {
		return memberID;
	}
	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getTrainerID() {
		return trainerID;
	}
	public void setTrainerID(String trainerID) {
		this.trainerID = trainerID;
	}
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public double getHeight() {
		return height;
	}
	public void setHeight(double height) {
		this.height = height;
	}
	public double getWeight() {
		return weight;
	}
	public void setWeight(double weight) {
		this.weight = weight;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public String getBadge() {
		return badge;
	}
	public void setBadge(String badge) {
		this.badge = badge;
	}
	public String getGymname() {
		return gymname;
	}
	public void setGymname(String gymname) {
		this.gymname = gymname;
	}
	public String getTrainerContent() {
		return trainerContent;
	}
	public void setTrainerContent(String trainerContent) {
		this.trainerContent = trainerContent;
	}
	public int getMemtype() {
		return memtype;
	}
	public void setMemtype(int memtype) {
		this.memtype = memtype;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	
	
	
	
}
