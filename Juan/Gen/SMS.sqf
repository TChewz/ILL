//SMS Functions by Jonny
ILG_SMS_Recieve = 
{
	Private ["_text","_sender"];
	_sender = _this select 0;
	_text = parseText format ["<t size='3' color='#FF0000'>*SMS*<t color='#FFFFFF' size='1.25'><br /><br />%1 just send you an SMS.<br />Check your inbox to view.",name _sender];   
	hint _text;
	systemChat format ["SMS Recieved. Sender: %1",name _sender];
	playSound "Youve_Got_Mail";
};

SMS_addText = 
{
	{
		lbAdd [1,format ["%1",_x]];
	}foreach SMS;
};