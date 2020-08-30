package bean;

public class CustomerBean {
	private String ssnId,status,message,lastUpdated,customerName,address,state,city,customerId;
	int age;
	public String getSsnId() {
		return ssnId;
	}
	public void setSsnId(String ssnId) {
		this.ssnId = ssnId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getLastUpdated() {
		return lastUpdated;
	}
	public void setLastUpdated(String lastUpdated) {
		this.lastUpdated = lastUpdated;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public CustomerBean(String ssnId, String status, String message, String lastUpdated, String customerName,
			String address, String state, String city, String customerId, int age) {
		this.ssnId = ssnId;
		this.status = status;
		this.message = message;
		this.lastUpdated = lastUpdated;
		this.customerName = customerName;
		this.address = address;
		this.state = state;
		this.city = city;
		this.customerId = customerId;
		this.age = age;
	}
	public CustomerBean()
	{}
		

}
