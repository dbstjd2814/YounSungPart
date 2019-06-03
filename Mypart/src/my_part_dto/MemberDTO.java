package my_part_dto;

public class MemberDTO {
	private String m_id;
	private String m_password;
	private String m_nickname;
	private String m_gender;
	private String m_agerange;
	private String m_monthday;
	private String m_phone;
	
	
	
	public MemberDTO(String m_id) {
		super();
		this.m_id = m_id;
	}
	public MemberDTO(String m_id, String m_password) {
		super();
		this.m_id = m_id;
		this.m_password = m_password;
	}
	public MemberDTO() {
		super();
	}
	public MemberDTO(String m_id, String m_password, String m_nickname, String m_gender, String m_agerange,
			String m_monthday, String m_phone) {
		super();
		this.m_id = m_id;
		this.m_password = m_password;
		this.m_nickname = m_nickname;
		this.m_gender = m_gender;
		this.m_agerange = m_agerange;
		this.m_monthday = m_monthday;
		this.m_phone = m_phone;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_password() {
		return m_password;
	}
	public void setM_password(String m_password) {
		this.m_password = m_password;
	}
	public String getM_nickname() {
		return m_nickname;
	}
	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}
	public String getM_gender() {
		return m_gender;
	}
	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}
	public String getM_agerange() {
		return m_agerange;
	}
	public void setM_agerange(String m_agerange) {
		this.m_agerange = m_agerange;
	}
	public String getM_monthday() {
		return m_monthday;
	}
	public void setM_monthday(String m_monthday) {
		this.m_monthday = m_monthday;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	
}
