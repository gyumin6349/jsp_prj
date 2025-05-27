package day0508;

public class memberDTO {
	private String idValue, passValue,
	passValue2,
	nameValue,
	birthValue,
	contactValue,
	phoneValue,
	email1Value,
	email2Value,
	gender,
	domain,
	zipcode,
	addr,
	explainValue;

	
	
	public memberDTO() {
	}



	public memberDTO(String idValue, String passValue, String passValue2, String nameValue, String birthValue,
			String contactValue, String phoneValue, String email1Value, String email2Value, String gender,
			String domain, String zipcode, String addr, String explainValue) {
		super();
		this.idValue = idValue;
		this.passValue = passValue;
		this.passValue2 = passValue2;
		this.nameValue = nameValue;
		this.birthValue = birthValue;
		this.contactValue = contactValue;
		this.phoneValue = phoneValue;
		this.email1Value = email1Value;
		this.email2Value = email2Value;
		this.gender = gender;
		this.domain = domain;
		this.zipcode = zipcode;
		this.addr = addr;
		this.explainValue = explainValue;
	}



	@Override
	public String toString() {
		return "memberDTO [idValue=" + idValue + ", passValue=" + passValue + ", passValue2=" + passValue2
				+ ", nameValue=" + nameValue + ", birthValue=" + birthValue + ", contactValue=" + contactValue
				+ ", phoneValue=" + phoneValue + ", email1Value=" + email1Value + ", email2Value=" + email2Value
				+ ", gender=" + gender + ", domain=" + domain + ", zipcode=" + zipcode + ", addr=" + addr
				+ ", explainValue=" + explainValue + ", getIdValue()=" + getIdValue() + ", getPassValue()="
				+ getPassValue() + ", getPassValue2()=" + getPassValue2() + ", getNameValue()=" + getNameValue()
				+ ", getBirthValue()=" + getBirthValue() + ", getContactValue()=" + getContactValue()
				+ ", getPhoneValue()=" + getPhoneValue() + ", getEmail1Value()=" + getEmail1Value()
				+ ", getEmail2Value()=" + getEmail2Value() + ", getGender()=" + getGender() + ", getDomain()="
				+ getDomain() + ", getZipcode()=" + getZipcode() + ", getAddr()=" + getAddr() + ", getExplainValue()="
				+ getExplainValue() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	
	

	public String getIdValue() {
		return idValue;
	}

	public void setIdValue(String idValue) {
		this.idValue = idValue;
	}

	public String getPassValue() {
		return passValue;
	}

	public void setPassValue(String passValue) {
		this.passValue = passValue;
	}

	public String getPassValue2() {
		return passValue2;
	}

	public void setPassValue2(String passValue2) {
		this.passValue2 = passValue2;
	}

	public String getNameValue() {
		return nameValue;
	}

	public void setNameValue(String nameValue) {
		this.nameValue = nameValue;
	}

	public String getBirthValue() {
		return birthValue;
	}

	public void setBirthValue(String birthValue) {
		this.birthValue = birthValue;
	}

	public String getContactValue() {
		return contactValue;
	}

	public void setContactValue(String contactValue) {
		this.contactValue = contactValue;
	}

	public String getPhoneValue() {
		return phoneValue;
	}

	public void setPhoneValue(String phoneValue) {
		this.phoneValue = phoneValue;
	}

	public String getEmail1Value() {
		return email1Value;
	}

	public void setEmail1Value(String email1Value) {
		this.email1Value = email1Value;
	}

	public String getEmail2Value() {
		return email2Value;
	}

	public void setEmail2Value(String email2Value) {
		this.email2Value = email2Value;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getExplainValue() {
		return explainValue;
	}

	public void setExplainValue(String explainValue) {
		this.explainValue = explainValue;
	}
	
	
	
	
}
