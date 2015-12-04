<% 
    If InStr(1, Request.ServerVariables("HTTP_USER_AGENT"), "MSIE") Then

%>
	<link title="combined" rel="stylesheet" type="text/css" media="screen" href="navigation.css" />
<% 
    Else
%>
    <link title="combined" rel="stylesheet" type="text/css" media="screen" href="navigation_ff.css" />
<% 
    End If
%>

<html>
<head>
<script type="text/javascript" src="Fader_02.js"></script>
<script type="text/javascript">
var g_isIE = false;
var g_isFirefox = false;
function getBrowser()
{
    if (navigator.userAgent.indexOf("MSIE") != -1)
    {
        g_isIE = true;
        if (navigator.userAgent.indexOf("MSIE 7") != -1)
        {
            g_isIE7 = true;
        }
    }
    else if (navigator.userAgent.indexOf("Firefox") != -1)
    {
        g_isFirefox = true;
    }
}

var contentArray = [];
contentArray['Experience'] = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed do eiusmod tempor incididunt ut labore dolore magna aliqua. Ut enim ad minim..";
contentArray['HotSpots'] = "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo...";
contentArray['AmusementParks'] = "Inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut...";
contentArray['IslandEscapes'] = "Sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet...";
contentArray['Casino'] = "Consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad...";
contentArray['Merry'] = "Minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure...";
contentArray['Golf'] = "Reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur...";
contentArray['Active'] = "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas...";
contentArray['Relaxing'] = "Molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga...";
contentArray['Historic'] = "Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id...";
contentArray['SpaLocales'] = "Quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis...";
contentArray['Retreats'] = "Aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente...";

var Slide1 = new Image();
var Slide2 = new Image();
var Slide3 = new Image();
var Slide4 = new Image();
var Slide5 = new Image();
var Slide6 = new Image();
var Slide7 = new Image();
var Slide8 = new Image();
var Slide9 = new Image();
var Slide10 = new Image();
var Slide11 = new Image();
var Slide12 = new Image();

var Slide1Text = new Image();
var Slide2Text = new Image();
var Slide3Text = new Image();
var Slide4Text = new Image();
var Slide5Text = new Image();
var Slide6Text = new Image();
var Slide7Text = new Image();
var Slide8Text = new Image();
var Slide9Text = new Image();
var Slide10Text = new Image();
var Slide11Text = new Image();
var Slide12Text = new Image();

Slide1.scr = "adventure.jpg";
Slide2.scr = "Iconica.jpg";
Slide3.scr = "amusement.jpg";
Slide4.scr = "beach.jpg";
Slide5.scr = "casino.jpg";
Slide6.scr = "restuarant";
Slide7.scr = "golf.jpg";
Slide8.scr = "more-adventure.jpg";
Slide9.scr = "swim.jpg";
Slide10.scr = "stone.jpg";
Slide11.scr = "spa.jpg";
Slide12.scr = "romantic.jpg";

Slide1Text.src = "http://media.expedia.com/media/content/expus/graphics/promos/deals/adventure_text.png";
Slide2Text.src = "http://media.expedia.com/media/content/expus/graphics/promos/deals/amusement_text.png";
Slide3Text.src = "http://media.expedia.com/media/content/expus/graphics/promos/deals/Iconica_text.png";
Slide4Text.src = "http://media.expedia.com/media/content/expus/graphics/promos/deals/beach_text.png";
Slide5Text.src = "http://media.expedia.com/media/content/expus/graphics/promos/deals/casino_text.png";
Slide6Text.src = "http://media.expedia.com/media/content/expus/graphics/promos/deals/restaurant_text.png";
Slide7Text.src = "http://media.expedia.com/media/content/expus/graphics/promos/deals/golf_text.png";
Slide8Text.src = "http://media.expedia.com/media/content/expus/graphics/promos/deals/historic_text.png";
Slide9Text.src = "http://media.expedia.com/media/content/expus/graphics/promos/deals/more-adventure_text.png";
Slide10Text.src = "http://media.expedia.com/media/content/expus/graphics/promos/deals/swim_text.png";
Slide11Text.src = "http://media.expedia.com/media/content/expus/graphics/promos/deals/spa_text.png";
Slide12Text.src = "http://media.expedia.com/media/content/expus/graphics/promos/deals/romantic_text.png";



function imagesOn(textimage, picimage, blurb, id) 
{
	for (var i = 0; i < 12; i++)
	{
		document.getElementById("slide"+i).className = 'turnHoverOff';
	}
	document.getElementById("slideX").className = 'JonesOff';
	document.getElementById("imageTitle").style.cssText = "filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+textimage+"', sizingMethod='scale'); position:absolute; left:0px; top:260px; z-index:10500;";
	if (g_isFirefox)
	{
		document.getElementById("imageTitle").style.cssText = "background-image:url("+textimage+"); background-repeat: no-repeat; position:absolute; left:0px; top:260px; z-index:10500;";
	}
	document.getElementById("transparentImage").src =  picimage;
	document.getElementById("transparentImage").style.cssText = "filter:progid:DXImageTransform.Microsoft.Fade(duration=3); position:relative; top:40px; left:30px; width:300px; height:200px; border:0px;";
	document.getElementById("content").innerHTML = contentArray[blurb];
	document.getElementById(id).className = 'turnHoverOn';
}
function turnNavOff(textimage, picimage, blurb, id)
{
	for (var i = 0; i < 12; i++)
	{
		document.getElementById("slide"+i).className = 'turnHoverOff';
	}
	document.getElementById("imageTitle").style.cssText = "filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='http://media.expedia.com/media/content/expus/graphics/promos/deals/Indy_text.png', sizingMethod='scale'); position:absolute; left:0px; top:260px; z-index:10500;";
	if (g_isFirefox)
	{
		document.getElementById("imageTitle").style.cssText = "background-image:url('http://media.expedia.com/media/content/expus/graphics/promos/deals/Indy_text.png'); background-repeat: no-repeat; position:absolute; left:0px; top:260px; z-index:10500;";
	}
	document.getElementById("transparentImage").src =  "adventure.jpg";
	document.getElementById("transparentImage").style.cssText = "filter:progid:DXImageTransform.Microsoft.Fade(duration=3); position:relative; top:40px; left:30px; width:300px; height:200px; border:0px;";
	document.getElementById("content").innerHTML = contentArray['Experience'];
	document.getElementById("slideX").className = 'JonesOn';
}

</script>

	<title>Test Trip Finder</title>
</head>

<body style="background-image:url(http://media.expedia.com/media/content/expus/graphics/promos/deals/trip_finder_landing_bg.jpg); background-repeat: no-repeat;" onload="getBrowser();">

<div class="navContainer">
    <div class="navList">
        <a id="slideX" class="JonesOff" href="finder.asp?category=experiences&region=indy" onmouseover = "window.setTimeout(function(){Fader.fadeIn(document.getElementById('transparentImage'))}, 1);turnNavOff();"  onmouseout = "turnNavOff();"></a> 
		<a id="slide0" class="menulistitem" href="finder.asp?category=hotspots&region=allinclusive" onmouseover = "window.setTimeout(function(){Fader.fadeIn(document.getElementById('transparentImage'))}, 1);imagesOn('http://media.expedia.com/media/content/expus/graphics/promos/deals/adventure_text.png','adventure.jpg', 'Experience', 'slide0')" onmouseout = "imagesOn('http://media.expedia.com/media/content/expus/graphics/promos/deals/adventure_text.png','adventure.jpg', 'Experience', 'slide0')">&nbsp;&bull; All-inclusive Hot Spots</a> 
        <a id="slide1" class="menulistitem" href="finder.asp?category=familyfun&region=US" onmouseover = "window.setTimeout(function(){Fader.fadeIn(document.getElementById('transparentImage'))}, 1);imagesOn('http://media.expedia.com/media/content/expus/graphics/promos/deals/amusement_text.png','Iconica.jpg', 'HotSpots', 'slide1')" onmouseout = "imagesOn('http://media.expedia.com/media/content/expus/graphics/promos/deals/amusement_text.png','Iconica.jpg', 'HotSpots', 'slide1')">&nbsp;&bull; Amusement/Theme Parks</a> 
        <a id="slide2" class="menulistitem" href="finder.asp?category=escapes&region=US" onmouseover = "window.setTimeout(function(){Fader.fadeIn(document.getElementById('transparentImage'))}, 1);imagesOn('http://media.expedia.com/media/content/expus/graphics/promos/deals/Iconica_text.png','amusement.jpg', 'AmusementParks', 'slide2')" onmouseout = "imagesOn('http://media.expedia.com/media/content/expus/graphics/promos/deals/Iconica_text.png','amusement.jpg', 'AmusementParks', 'slide2')">&nbsp;&bull; Beach & Island Escapes</a> 
        <a id="slide3" class="menulistitem" href="finder.asp?category=cities&region=US" onmouseover = "window.setTimeout(function(){Fader.fadeIn(document.getElementById('transparentImage'))}, 1);imagesOn('http://media.expedia.com/media/content/expus/graphics/promos/deals/beach_text.png','beach.jpg', 'IslandEscapes', 'slide3')" onmouseout = "imagesOn('http://media.expedia.com/media/content/expus/graphics/promos/deals/beach_text.png','beach.jpg', 'IslandEscapes', 'slide3')">&nbsp;&bull; BrightLights, Big Cities</a>
        <a id="slide4" class="menulistitem" href="finder.asp?category=casinos&region=US" onmouseover = "window.setTimeout(function(){Fader.fadeIn(document.getElementById('transparentImage'))}, 1);imagesOn('http://media.expedia.com/media/content/expus/graphics/promos/deals/casino_text.png','casino.jpg', 'Casino', 'slide4')" onmouseout = "imagesOn('http://media.expedia.com/media/content/expus/graphics/promos/deals/casino_text.png','casino.jpg', 'Casino', 'slide4')">&nbsp;&bull; Casinos Galore</a>
        <a id="slide5" class="menulistitem" href="finder.asp?category=dining&region=US" onmouseover = "window.setTimeout(function(){Fader.fadeIn(document.getElementById('transparentImage'))}, 1);imagesOn('http://media.expedia.com/media/content/expus/graphics/promos/deals/restaurant_text.png','restaurant.jpg', 'Merry', 'slide5')" onmouseout = "imagesOn('http://media.expedia.com/media/content/expus/graphics/promos/deals/restaurant_text.png','restaurant.jpg', 'Merry', 'slide5')">&nbsp;&bull; Dining Destinations</a>
        <a id="slide6" class="menulistitem" href="finder.asp?category=golf&region=US" onmouseover = "window.setTimeout(function(){Fader.fadeIn(document.getElementById('transparentImage'))}, 1);imagesOn('http://media.expedia.com/media/content/expus/graphics/promos/deals/golf_text.png','golf.jpg', 'Golf', 'slide6')" onmouseout = "imagesOn('http://media.expedia.com/media/content/expus/graphics/promos/deals/golf_text.png','golf.jpg', 'Golf', 'slide6')">&nbsp;&bull; Golf Getaways</a>
        <a id="slide7" class="menulistitem" href="finder.asp?category=historical&region=US" onmouseover = "window.setTimeout(function(){Fader.fadeIn(document.getElementById('transparentImage'))}, 1);imagesOn('http://media.expedia.com/media/content/expus/graphics/promos/deals/historic_text.png','more_adventure.jpg', 'Historic', 'slide7')" onmouseout = "imagesOn('http://media.expedia.com/media/content/expus/graphics/promos/deals/historic_text.png','more_adventure.jpg', 'Historic', 'slide7')">&nbsp;&bull; Historic and Cultural Experiences</a>
        <a id="slide8" class="menulistitem" href="finder.asp?category=exploration&region=US" onmouseover = "window.setTimeout(function(){Fader.fadeIn(document.getElementById('transparentImage'))}, 1);imagesOn('http://media.expedia.com/media/content/expus/graphics/promos/deals/more_adventure_text.png','swim.jpg', 'Relaxing', 'slide8')" onmouseout = "imagesOn('http://media.expedia.com/media/content/expus/graphics/promos/deals/more_adventure_text.png','swim.jpg', 'Relaxing', 'slide8')">&nbsp;&bull; Mountain Exploration</a>
        <a id="slide9" class="menulistitem" href="finder.asp?category=parks&region=US" onmouseover = "window.setTimeout(function(){Fader.fadeIn(document.getElementById('transparentImage'))}, 1);imagesOn('http://media.expedia.com/media/content/expus/graphics/promos/deals/swim_text.png','stone.jpg', 'Active', 'slide9')" onmouseout = "imagesOn('http://media.expedia.com/media/content/expus/graphics/promos/deals/swim_text.png','stone.jpg', 'Active', 'slide9')">&nbsp;&bull; Parks, Lakes & Rivers</a>
        <a id="slide10" class="menulistitem" href="finder.asp?category=spas&region=US" onmouseover = "window.setTimeout(function(){Fader.fadeIn(document.getElementById('transparentImage'))}, 1);imagesOn('http://media.expedia.com/media/content/expus/graphics/promos/deals/spa_text.png','spa.jpg', 'SpaLocales', 'slide10')" onmouseout = "imagesOn('http://media.expedia.com/media/content/expus/graphics/promos/deals/spa_text.png','spa.jpg', 'SpaLocales', 'slide10')">&nbsp;&bull; Resort and Spa Locales</a>
        <a id="slide11" class="menulistitem" href="finder.asp?category=retreats&region=US" onmouseover = "window.setTimeout(function(){Fader.fadeIn(document.getElementById('transparentImage'))}, 1);imagesOn('http://media.expedia.com/media/content/expus/graphics/promos/deals/romantic_text.png','romantic.jpg', 'Retreats', 'slide11')" onmouseout = "imagesOn('http://media.expedia.com/media/content/expus/graphics/promos/deals/romantic_text.png','romantic.jpg', 'Retreats', 'slide11')">&nbsp;&bull; Romantic Retreats</a>
    </div>
</div>
<div class="slideshow" style="">
    <img id="transparentImage" alt="Trip Finder Location" src="http://media.expedia.com/media/content/expus/graphics/promos/deals/blank.gif"  style="width:300px; height:200px; border:0px; top:40px; left:30px; position:absolute; top:40px; left:30px;" />
    <div id="pressboardMount" style="width:350px; height:347px; z-index:10000; position:absolute; left:0px; top:0px; filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='http://media.expedia.com/media/content/expus/graphics/promos/deals/polaroid_frame.png', sizingMethod='scale');">
    </div>
    <img id="imageTitle" alt="Trip Finder Title" src="http://media.expedia.com/media/content/expus/graphics/promos/deals/blank.gif" width="367" height="40" border="0" style="" />
</div>
<div id="content" class="content"></div>

</body>
</html>




















