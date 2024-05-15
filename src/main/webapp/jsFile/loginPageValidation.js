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
						pattern=/(?=.*[!@#$%^&*_+])/g
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
						msg.innerHTML="invalid (Minimum 1 special Symbol required)";
						msg.style.color="red";
						msg.style.border="1 px solid red";
						msg.style.padding="5px";	
						}	
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

//========================Email validaion==================================================================

function emailValid(str)
{
	var pattern,res;
	pattern=/^[a-z0-9.*+-_]+@[a-z0-9.*+-_]+\.[a-z]{2,3}$/g
	res=str.match(pattern);
	if(res!=null)
	{
		document.getElementById("email").innerHTML="valid";
		document.getElementById("email").style.color="green";
		document.getElementById("email").style.border="1px solid green";
		document.getElementById("email").style.padding="0 30px 0 30px";
		document.getElementById("email").style.borderRadius="6px";
	}
	else
	{
		var msg=document.getElementById("email");
		msg.innerHTML="required valid email";
		msg.style.color="red";
	msg.style.border="1px solid red";
	msg.style.padding="0 10px 0 10px";
	msg.style.bordreRadius="6px"
		
	}
}
//===================Contact Validation==============================================================================

function contactValid(str)
{
		pattern=/\d{10}/
	res=str.match(pattern);
	if(res!=null && str.length==10)
	{
		document.getElementById("contact").innerHTML="valid";
		document.getElementById("contact").style.color="green";
		document.getElementById("contact").style.border="1px solid green";
		document.getElementById("contact").style.padding="0 30px 0 30px";
		document.getElementById("contact").style.borderRadius="6px";
	}
	else{
		 msg=document.getElementById("contact");
		msg.innerHTML="10 digit required";
		msg.style.color="red";
	msg.style.border="1px solid red";
	msg.style.padding="0 10px 0 10px";
	msg.style.bordreRadius="6px"
	}
}
//===================surname validation================================================================================
function surnameValid(str)
{
	var pattern = /^[a-zA-Z]+$/;
	res=str.match(pattern);
	if(res!=null)
	{
		document.getElementById("surname").innerHTML="valid";
		document.getElementById("surname").style.color="green";
		document.getElementById("surname").style.border="1px solid green"
		documen.getElementBYID("surname").style.borderRadius="6px";
		documetn.getElementById("surname").style.padding="0 30px 0 30px"
	}
	else{
		 msg=document.getElementById("surname");
		msg.innerHTML="Only alphabet";
		msg.style.color="red";
	msg.style.border="1px solid red";
	msg.style.padding="0 10px 0 10px";
	msg.style.bordreRadius="6px"
	}
}
//===================name validation================================================================================
function nameValid(str)
{
	var pattern = /^[a-zA-Z]+$/;
	res=str.match(pattern);
	if(res!=null)
	{
		document.getElementById("name").innerHTML="valid";
		document.getElementById("name").style.color="green";
		document.getElementById("name").style.border="1px solid green"
		documen.getElementBYID("name").style.borderRadius="6px";
		documetn.getElementById("name").style.padding="0 30px 0 30px"
	}
	else{
		 msg=document.getElementById("name");
		msg.innerHTML="Only alphabet";
		msg.style.color="red";
	msg.style.border="1px solid red";
	msg.style.padding="0 10px 0 10px";
	msg.style.bordreRadius="6px"
	}
}
//=======================salary validation=============================================================================
function salaryValid(str)
{
		pattern=/[0-9]/
	res=str.match(pattern);
	if(res!=null)
	{
		document.getElementById("sal").innerHTML="valid";
		document.getElementById("sal").style.color="green";
		document.getElementById("sal").style.border="1px solid green";
		document.getElementById("sal").style.padding="0 30px 0 30px";
		document.getElementById("sal").style.borderRadius="6px";
	}
	else{
		 msg=document.getElementById("sal");
		msg.innerHTML="only digit";
		msg.style.color="red";
	msg.style.border="1px solid red";
	msg.style.padding="0 10px 0 10px";
	msg.style.bordreRadius="6px"
	}
}


