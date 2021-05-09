function ValidateEmail(username1)
{
var mailformat = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
if(username1.value.match(mailformat))
{
alert("Valid email address!");
document.getElementById("loginForm").submit();
}
else
{
alert("You have entered an invalid email address!");
username.focus();
}
}