
playMusic "Intro";

_text = [


"<t underline='false' color='#00FFFF'>www.IslandLifeLiberation.net</t><br/>",

"<t underline='true' color='#00FFFF'>ACCOUNT STATS NOT LOADED?</t><br/>
If you have just joined the server and your stats have not loaded, You have 2 Minutes to relog or they will be lost forever.",

"<t underline='true' color='#00FFFF'>Next Update</t><br/>
Date Not Set",

"<t underline='true' color='#00FFFF'>Contact</t><br />
TS3: ILL.TS3DNS.COM<br />
Welcome to Island Life Liberation<br />
<br />
Please visit the forums to fill out bug reports or post suggestions and to keep up to date on the rules.
<br />
<br />
Only click 'Continue' if you are willing to read and play by the rules, keep in mind this is a ROLE PLAY server!"

];

_t = [];
{
_t = _t + [(parseText _x)];
} foreach _text;
_text = _t;

"Island Life Liberation!" hintC _text;
