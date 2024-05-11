function passwordValid(str)
{
	var pattern,res;
if(str.length>=8)
	{
		pattern=/(?=.*\d)/g	
		res=str.match(pattern);
		if(res!=null)
			{
			pattern=/(?=.*[a-z])/g
			res=str.match(pattern);
				if(res!=null)
				{
					pattern=/(?=.*[A-Z])/g
					res=str.match(pattern);
					if(res!=null)
					{
						document.getElementById("pass").innerHTML="valid";
						document.getElementById("pass").style.color="green";
						document.getElementById("pass").style.border="1px solid green";
						document.getElementById("pass").style.padding="0 30px 0 30px";
						document.getElementById("pass").style.borderRadius="6px";
					}
					
					else{
						var msg=document.getElementById("pass");
						msg.innerHTML="invalid (Minimum 1 capital alphabet required)";
						msg.style.color="red";
						msg.style.border="1 px solid red";
						msg.style.padding="5px";
						
						
					}
				}
				else{
					var msg=document.getElementById("pass");
					msg.innerHTML="invalid (Minimum 1 small alphabet required)";
					msg.style.color="red";
					msg.style.border="1 px solid red";
					msg.style.padding="5px";
				}
			}
else{
	var msg=document.getElementById("pass");
	msg.innerHTML="invalid (Minimum 1 digit Required)";
	msg.style.color="red";
	msg.style.border="1 px solid red";
	msg.style.padding="5px";
}

	}
else
	{
	var msg=document.getElementById("pass");
	msg.innerHTML="Invalid (Minimum 8 character required)";
	msg.style.color="red";
	msg.style.border="1px solid red";
	msg.style.padding="5px";
	}

}