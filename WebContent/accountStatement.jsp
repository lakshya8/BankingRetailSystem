<html>
<head>
<title>Account Statement</title>
<script>
function validate1()
{
//	alert(document.getElementById("action").value);
	//if(document.getElementById("action").value.equals("transaction"))
		//{
		if(document.getElementById("r1").style.visibility=="visible")
			{
			document.getElementById("r1").style.visibility="hidden";
			document.getElementById("r2").style.visibility="hidden";
			}
		document.getElementById("number").style.visibility="visible";
		//}
}
function validate2()
{
//	alert(document.getElementById("action").value);
	//if(document.getElementById("action").value.equals("transaction"))
		//{
		if(document.getElementById("number").style.visibility=="visible")
			{
			document.getElementById("number").style.visibility="hidden";
			}
		document.getElementById("r1").style.visibility="visible";
		document.getElementById("r2").style.visibility="visible";
		//}
}
</script>
</head>
<body>
<form action="viewTransaction.jsp"> 
<table>
<tr><td>Account ID:</td>
<td><input type="text" name="account_id" id="account_id"></td></tr>
<tr><td colspan="2">
<input type="radio" name="action" value="transaction" onclick="validate1()">Last Number of Transactions</td></tr>
<tr><td colspan="2">
<input type="radio" name="action" value="date" onclick="validate2()">Start-End Date</td></tr>
<tr id="r1" style="visibility:hidden"><td>Start Date:</td><td><input type="date" name="start" ></td></tr>
<tr id="r2" style="visibility:hidden"><td>End Date:</td><td><input type="date" name="end"></td></tr>
<tr><td colspan="2" align="center">
<select name="number" id="number" style="visibility:hidden">
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
<option value="6">6</option>
<option value="7">7</option>
<option value="8">8</option>
<option value="9">9</option>
<option value="10">10</option>
</select><br>
</td></tr>
<tr><td align="center" colspan="2"><input type="submit" value="Submit"></td></tr>
</table>
</form>

</body>
</html>