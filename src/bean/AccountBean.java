package bean;

public class AccountBean {
	private int deposit;
	private String customer_Id,account_id,status,message,account_type,last_updated;
	public AccountBean(String customer_Id, String account_id, int deposit, String status, String message, String account_type,
			String last_updated) {
		this.customer_Id = customer_Id;
		this.account_id = account_id;
		this.deposit = deposit;
		this.status = status;
		this.message = message;
		this.account_type = account_type;
		this.last_updated = last_updated;
	}
	public String getCustomer_Id() {
		return customer_Id;
	}
	public void setCustomer_Id(String customer_Id) {
		this.customer_Id = customer_Id;
	}
	public String getAccount_id() {
		return account_id;
	}
	public void setAccount_id(String account_id) {
		this.account_id = account_id;
	}
	public int getDeposit() {
		return deposit;
	}
	public void setDeposit(int deposit) {
		this.deposit = deposit;
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
	public String getAccount_type() {
		return account_type;
	}
	public void setAccount_type(String account_type) {
		this.account_type = account_type;
	}
	public String getLast_updated() {
		return last_updated;
	}
	public void setLast_updated(String last_updated) {
		this.last_updated = last_updated;
	}
}
