<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Language" content="en-us" />
<meta http-equiv="Content-type" content="text/html; charset=iso-8859-1"/>
<META NAME="keywords" content="resort, cheap hotels, motel reservations, Cheap Hotel Rates, Discount Hotel Reservation, Discount Hotel Rooms, Cheap Hotel, Hotel Rates, Hotel Reservation, Discount Hotel, Hotel Rooms">
<META NAME="description" content="Cheap Hotel Rates, Expedia.com is the premier online travel planning site. Discount Hotel Reservation, purchase airline tickets online, find vacation packages, and make hotel and car reservations, find maps, destination information, travel news and more.">

<title>Trip Finder</title>
<% If InStr(1, Request.ServerVariables("HTTP_USER_AGENT"), "MSIE") Then %>
<link title="combined" rel="stylesheet" type="text/css" media="screen" href="navigation.css" />
<% Else %>
<link title="combined" rel="stylesheet" type="text/css" media="screen" href="navigation_ff.css" />
<% End If %>
<style type="text/css">
.ftrCapt {color:#fef3c6 !important;}
</style>
</head>

<!--#include virtual="/daily/prod/common/header.asp"-->
<link rel="stylesheet" type="text/css" href="/daily/styles/core.css?v=4" />
<link rel="stylesheet" type="text/css" href="/daily/styles/mainwide.css?v=1" />

<div id="divContent" style="background-image:url(http://media.expedia.com/media/content/expus/graphics/promos/deals/trip_finder_landing_bg.jpg); background-repeat: no-repeat;position:relative;width:992px;height:856px;">
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
    document.getElementById("slideX").className = 'JonesOn';
    document.getElementById("transparentImage").src =  "http://media.expedia.com/media/content/expus/graphics/promos/deals/indiana_jones_travel_exp.jpg";
    document.getElementById("transparentImage").style.cssText = "filter:progid:DXImageTransform.Microsoft.Fade(duration=1); position:relative; top:30px; left:30px; width:284px; height:221px; border:0px;";
    document.getElementById("imageTitle").style.cssText = "filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='http://media.expedia.com/media/content/expus/graphics/promos/deals/Indy_text.png', sizingMethod='scale'); position:absolute; left:0px; top:260px; z-index:10500;";
    document.getElementById("content").innerHTML = contentArray['Experience'];
    if (g_isFirefox)
	{
		document.getElementById("imageTitle").style.cssText = "background-image:url('http://media.expedia.com/media/content/expus/graphics/promos/deals/Indy_text.png'); background-repeat: no-repeat; position:absolute; left:0px; top:260px; z-index:10500;";
	}
}

var contentArray = [];
contentArray['Experience'] = "Follow in the footsteps of the world's most intrepid movie hero with ten exclusive and affordable Travel Experiences inspired by the <i>Indiana Jones</i>&#8482; movies. Each personal tour is customized for maximum fun. <a href='indy.asp?category=experiences&region=indy&friendly=13' onmouseover='this.className=\"catLinkHover\";' onmouseout='this.className=\"catLink\";' class='catLink'>See more</a> <img src='http://media.expedia.com/media/content/expus/graphics/promos/deals/tf_arrow.gif' />";
contentArray['HotSpots'] = "Luxuriate in the sun and let your worries slip away. These resort escapes include your room, meals, drinks, and activities, all covered for one price. <a href='finder.asp?category=hotspots&region=allinclusive&friendly=1' onmouseover='this.className=\"catLinkHover\";' onmouseout='this.className=\"catLink\";' class='catLink'>See more</a> <img src='http://media.expedia.com/media/content/expus/graphics/promos/deals/tf_arrow.gif' />";
contentArray['AmusementParks'] = "Blast into a vacation where the rides leave you breathless. These unique destinations offer attractions for the whole family to enjoy. <a href='finder.asp?category=familyfun&region=US&friendly=2' onmouseover='this.className=\"catLinkHover\";' onmouseout='this.className=\"catLink\";' class='catLink'>See more</a> <img src='http://media.expedia.com/media/content/expus/graphics/promos/deals/tf_arrow.gif' />";
contentArray['IslandEscapes'] = "Craving the gentle rhythm of ocean waves? These relaxing destinations promise sandy beaches, swaying palms, and remote coves ideal for bare feet. <a href='finder.asp?category=escapes&region=US&friendly=3' onmouseover='this.className=\"catLinkHover\";' onmouseout='this.className=\"catLink\";' class='catLink'>See more</a> <img src='http://media.expedia.com/media/content/expus/graphics/promos/deals/tf_arrow.gif' />";
contentArray['Cities'] = "Embark on an urban adventure. For spectacular skylines, world class shopping, fine dining, entertainment, and art, these urban hot spots have it all. <a href='finder.asp?category=cities&region=US&friendly=4' onmouseover='this.className=\"catLinkHover\";' onmouseout='this.className=\"catLink\";' class='catLink'>See more</a> <img src='http://media.expedia.com/media/content/expus/graphics/promos/deals/tf_arrow.gif' />";
contentArray['Casino'] = "Here's where to experience the thrill of a winning poker hand or a lucky roll of the dice. High rollers and low-stakes players welcome. <a href='finder.asp?category=casinos&region=allinclusive&friendly=5' onmouseover='this.className=\"catLinkHover\";' onmouseout='this.className=\"catLink\";' class='catLink'>See more</a> <img src='http://media.expedia.com/media/content/expus/graphics/promos/deals/tf_arrow.gif' />";
contentArray['Merry'] = "There are those with a taste for adventure, and those with adventurous tastes. These getaways  cater to travelers searching for the culinary experience of a lifetime. <a href='finder.asp?category=dining&region=US&friendly=6' onmouseover='this.className=\"catLinkHover\";' onmouseout='this.className=\"catLink\";' class='catLink'>See more</a> <img src='http://media.expedia.com/media/content/expus/graphics/promos/deals/tf_arrow.gif' />";
contentArray['Golf'] = "Play fairways rich in history and heritage. The world's most exclusive courses exemplify these resort destinations catering to the discerning golfer. <a href='finder.asp?category=golf&region=US&friendly=7' onmouseover='this.className=\"catLinkHover\";' onmouseout='this.className=\"catLink\";' class='catLink'>See more</a> <img src='http://media.expedia.com/media/content/expus/graphics/promos/deals/tf_arrow.gif' />";
contentArray['Historic'] = "Pack your rugged boots for these vacation destinations for the avid outdoor enthusiast. Or just sit back, take in breathtaking vistas, and watch Mother Nature put on a show. <a href='finder.asp?category=outdoors&region=US&friendly=8' onmouseover='this.className=\"catLinkHover\";' onmouseout='this.className=\"catLink\";' class='catLink'>See more</a> <img src='http://media.expedia.com/media/content/expus/graphics/promos/deals/tf_arrow.gif' />";
contentArray['Relaxing'] = "Walk in the footsteps of those who moved the world. These enriching adventures offer awe-inspiring art and opportunities to live history. <a href='finder.asp?category=historical&region=US&friendly=9' onmouseover='this.className=\"catLinkHover\";' onmouseout='this.className=\"catLink\";' class='catLink'>See more</a> <img src='http://media.expedia.com/media/content/expus/graphics/promos/deals/tf_arrow.gif' />";
contentArray['Active'] = "Refocus. Find peace. Treat your body and soul to revitalizing sensory experiences at these luxurious resort escapes. <a href='finder.asp?category=spas&region=US&friendly=10' onmouseover='this.className=\"catLinkHover\";' onmouseout='this.className=\"catLink\";' class='catLink'>See more</a> <img src='http://media.expedia.com/media/content/expus/graphics/promos/deals/tf_arrow.gif' />";
contentArray['SpaLocales'] = "Fall in love over and over again. These gorgeous destinations provide sublime settings for your  romantic getaway. <a href='finder.asp?category=retreats&region=US&friendly=11' onmouseover='this.className=\"catLinkHover\";' onmouseout='this.className=\"catLink\";' class='catLink'>See more</a> <img src='http://media.expedia.com/media/content/expus/graphics/promos/deals/tf_arrow.gif' />";
contentArray['Retreats'] = "Aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum <a href='finder.asp?category=retreats&region=US&friendly=12' onmouseover='this.className=\"catLinkHover\";' onmouseout='this.className=\"catLink\";' class='catLink'>See more</a> <img src='http://media.expedia.com/media/content/expus/graphics/promos/deals/tf_arrow.gif' />";

var Slide1  = new Image();
var Slide2  = new Image();
var Slide3  = new Image();
var Slide4  = new Image();
var Slide5  = new Image();
var Slide6  = new Image();
var Slide7  = new Image();
var Slide8  = new Image();
var Slide9  = new Image();
var Slide10 = new Image();
var Slide11 = new Image();
var Slide12 = new Image();
var Slide1Text  = new Image();
var Slide2Text  = new Image();
var Slide3Text  = new Image();
var Slide4Text  = new Image();
var Slide5Text  = new Image();
var Slide6Text  = new Image();
var Slide7Text  = new Image();
var Slide8Text  = new Image();
var Slide9Text  = new Image();
var Slide10Text = new Image();
var Slide11Text = new Image();
var Slide12Text = new Image();


var sImgRoot = "http://media.expedia.com/media/content/expus/graphics/promos/deals/";

Slide1.src  = sImgRoot + "adventure.jpg";
Slide2.src  = sImgRoot + "Iconica.jpg";
Slide3.src  = sImgRoot + "amusement.jpg";
Slide4.src  = sImgRoot + "beach.jpg";
Slide5.src  = sImgRoot + "casino.jpg";
Slide6.src  = sImgRoot + "restaurant.jpg";
Slide7.src  = sImgRoot + "golf.jpg";
Slide8.src  = sImgRoot + "more_adventure.jpg";
Slide9.src  = sImgRoot + "swim.jpg";
Slide10.src = sImgRoot + "stone.jpg";
Slide11.src = sImgRoot + "spa.jpg";
Slide12.src = sImgRoot + "romantic.jpg";

Slide1Text.src  = sImgRoot + "adventure_text.png";
Slide2Text.src  = sImgRoot + "Iconica_text.png";
Slide3Text.src  = sImgRoot + "amusement_text.png";
Slide4Text.src  = sImgRoot + "beach_text.png";
Slide5Text.src  = sImgRoot + "casino_text.png";
Slide6Text.src  = sImgRoot + "restaurant_text.png";
Slide7Text.src  = sImgRoot + "golf_text.png";
Slide8Text.src  = sImgRoot + "historic_text.png";
Slide9Text.src  = sImgRoot + "more-adventure_text.png";
Slide10Text.src = sImgRoot + "swim_text.png";
Slide11Text.src = sImgRoot + "spa_text.png";
Slide12Text.src = sImgRoot + "romantic_text.png";



function imagesOn(textimage, picimage, blurb, id) 
{
	for (var i = 0; i < 11; i++)
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
	document.getElementById("transparentImage").style.cssText = "filter:progid:DXImageTransform.Microsoft.Fade(duration=1); position:relative; top:30px; left:30px; width:284px; height:221px; border:0px;";
	document.getElementById("content").innerHTML = contentArray[blurb];
	document.getElementById(id).className = 'turnHoverOn';
}
function turnNavOff(textimage, picimage, blurb, id)
{
	for (var i = 0; i < 11; i++)
	{
		document.getElementById("slide"+i).className = 'turnHoverOff';
	}
	document.getElementById("imageTitle").style.cssText = "filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='http://media.expedia.com/media/content/expus/graphics/promos/deals/Indy_text.png', sizingMethod='scale'); position:absolute; left:0px; top:260px; z-index:10500;";
	if (g_isFirefox)
	{
		document.getElementById("imageTitle").style.cssText = "background-image:url('http://media.expedia.com/media/content/expus/graphics/promos/deals/Indy_text.png'); background-repeat: no-repeat; position:absolute; left:0px; top:260px; z-index:10500;";
	}
	document.getElementById("transparentImage").src =  "http://media.expedia.com/media/content/expus/graphics/promos/deals/indiana_jones_travel_exp.jpg";
	document.getElementById("transparentImage").style.cssText = "filter:progid:DXImageTransform.Microsoft.Fade(duration=1); position:relative; top:30px; left:30px; width:284px; height:221px; border:0px;";
	document.getElementById("content").innerHTML = contentArray['Experience'];
	document.getElementById("slideX").className = 'JonesOn';
}

function addEvent(obj,evType,fn){if(obj.addEventListener){obj.addEventListener(evType,fn,false);return true;}else if(obj.attachEvent){var r=obj.attachEvent("on"+evType,fn);return r;}else{return false;}}

addEvent(window, 'load', getBrowser);

</script>
<!--#include virtual="/daily/vacations/summerofadventure/tripfinder/breadcrumbs.asp"-->
<div id="content" class="content">
</div>
<div id="flashContainer" style="position:absolute;top:36px;left:212px;"></div>
<script language="JavaScript">
	var hasRightVersion = DetectFlashVer(requiredMajorVersion, requiredMinorVersion, requiredRevision);
	if (hasRightVersion)
	{
		CreateFlashControl("flashContainer", "http://media.expedia.com/media/content/expus/graphics/promos/deals/tripfinder/trip_finder_intro_final.swf", "", "false", "555", "218", "", "");
	}
	else
	{
		
		var alternateContent = '<img src=\"http://media.expedia.com/media/content/expus/graphics/promos/deals/tripfinder/Expedia_tripfinder_intro-static.jpg\" alt=\"Trip finder\" />';
		document.getElementById("flashContainer").innerHTML = alternateContent;  // insert non-flash content
		
	}
</script>
<div id="marriott" style="width:124px; height:52px; z-index:10000; position:absolute; left:850px; top:16px; background-image:url(http://media.expedia.com/media/content/expus/graphics/promos/deals/tripfinder/marriott_logo.jpg); background-repeat:no-repeat;"></div>
<a href="http://www.expedia.com/daily/vacations/summerofadventure/sale/default.asp" style="cursor:pointer;"><div id="summersale" style="width:179px; height:150px; z-index:10000; position:absolute; left:800px; top:77px; filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='http://media.expedia.com/media/content/expus/graphics/promos/deals/tripfinder/ad_summersale.png', sizingMethod='scale');"></div></a>
<div class="navContainer">
    <div class="navList">
        <a id="slideX" class="JonesOff" href="indy.asp?category=experiences&region=indy&friendly=13" onmouseover = "window.setTimeout(function(){Fader.fadeIn(document.getElementById('transparentImage'))}, 1);turnNavOff();"  onmouseout = "turnNavOff();"></a> 
		<a id="slide0" class="menulistitem" href="finder.asp?category=hotspots&region=allinclusive&friendly=1" onmouseover = "window.setTimeout(function(){Fader.fadeIn(document.getElementById('transparentImage'))}, 1);imagesOn(Slide1Text.src, Slide1.src, 'HotSpots', 'slide0')" onmouseout = "imagesOn(Slide1Text.src, Slide1.src, 'HotSpots', 'slide0')">&nbsp;&bull; All-inclusive Hot Spots</a> 
        <a id="slide1" class="menulistitem" href="finder.asp?category=familyfun&region=US&friendly=2" onmouseover = "window.setTimeout(function(){Fader.fadeIn(document.getElementById('transparentImage'))}, 1);imagesOn(Slide3Text.src, Slide2.src, 'AmusementParks', 'slide1')" onmouseout = "imagesOn(Slide3Text.src, Slide2.src, 'AmusementParks', 'slide1')">&nbsp;&bull; Amusement/Theme Parks</a> 
        <a id="slide2" class="menulistitem" href="finder.asp?category=escapes&region=US&friendly=3" onmouseover = "window.setTimeout(function(){Fader.fadeIn(document.getElementById('transparentImage'))}, 1);imagesOn(Slide2Text.src, Slide3.src, 'IslandEscapes', 'slide2')" onmouseout = "imagesOn(Slide2Text.src, Slide3.src, 'IslandEscapes', 'slide2')">&nbsp;&bull; Beach & Island Escapes</a> 
        <a id="slide3" class="menulistitem" href="finder.asp?category=cities&region=US&friendly=4" onmouseover = "window.setTimeout(function(){Fader.fadeIn(document.getElementById('transparentImage'))}, 1);imagesOn(Slide4Text.src, Slide4.src, 'Cities', 'slide3')" onmouseout = "imagesOn(Slide4Text.src, Slide4.src, 'Cities', 'slide3')">&nbsp;&bull; Bright Lights, Big Cities</a>
        <a id="slide4" class="menulistitem" href="finder.asp?category=casinos&region=allinclusive&friendly=5" onmouseover = "window.setTimeout(function(){Fader.fadeIn(document.getElementById('transparentImage'))}, 1);imagesOn(Slide5Text.src, Slide5.src, 'Casino', 'slide4')" onmouseout = "imagesOn(Slide5Text.src, Slide5.src, 'Casino', 'slide4')">&nbsp;&bull; Casinos Galore</a>
        <a id="slide5" class="menulistitem" href="finder.asp?category=dining&region=US&friendly=6" onmouseover = "window.setTimeout(function(){Fader.fadeIn(document.getElementById('transparentImage'))}, 1);imagesOn(Slide6Text.src, Slide6.src, 'Merry', 'slide5')" onmouseout = "imagesOn(Slide6Text.src, Slide6.src, 'Merry', 'slide5')">&nbsp;&bull; Dining Destinations</a>
        <a id="slide6" class="menulistitem" href="finder.asp?category=golf&region=US&friendly=7" onmouseover = "window.setTimeout(function(){Fader.fadeIn(document.getElementById('transparentImage'))}, 1);imagesOn(Slide7Text.src, Slide7.src, 'Golf', 'slide6')" onmouseout = "imagesOn(Slide7Text.src, Slide7.src, 'Golf', 'slide6')">&nbsp;&bull; Golf Getaways</a>
        <a id="slide7" class="menulistitem" href="finder.asp?category=outdoors&region=US&friendly=8" onmouseover = "window.setTimeout(function(){Fader.fadeIn(document.getElementById('transparentImage'))}, 1);imagesOn(Slide8Text.src, Slide8.src, 'Historic', 'slide7')" onmouseout = "imagesOn(Slide8Text.src, Slide8.src, 'Historic', 'slide7')">&nbsp;&bull; The Great Outdoors</a>
        <a id="slide8" class="menulistitem" href="finder.asp?category=historical&region=US&friendly=9" onmouseover = "window.setTimeout(function(){Fader.fadeIn(document.getElementById('transparentImage'))}, 1);imagesOn(Slide9Text.src, Slide9.src, 'Relaxing', 'slide8')" onmouseout = "imagesOn(Slide9Text.src, Slide9.src, 'Relaxing', 'slide8')">&nbsp;&bull; Historical &amp; Cultural Experiences</a>
        <a id="slide9" class="menulistitem" href="finder.asp?category=spas&region=US&friendly=10" onmouseover = "window.setTimeout(function(){Fader.fadeIn(document.getElementById('transparentImage'))}, 1);imagesOn(Slide10Text.src, Slide10.src, 'Active', 'slide9')" onmouseout = "imagesOn(Slide10Text.src, Slide10.src, 'Active', 'slide9')">&nbsp;&bull; Resort &amp; Spa Locales</a>
        <a id="slide10" class="menulistitem" href="finder.asp?category=retreats&region=US&friendly=11" onmouseover = "window.setTimeout(function(){Fader.fadeIn(document.getElementById('transparentImage'))}, 1);imagesOn(Slide11Text.src, Slide11.src, 'SpaLocales', 'slide10')" onmouseout = "imagesOn(Slide11Text.src, Slide11.src, 'SpaLocales', 'slide10')">&nbsp;&bull; Romantic Retreats</a>
        <!--<a id="slide11" class="menulistitem" href="finder.asp?category=retreats&region=US&friendly=12" onmouseover = "window.setTimeout(function(){Fader.fadeIn(document.getElementById('transparentImage'))}, 1);imagesOn(Slide12Text.src, Slide12.src, 'Retreats', 'slide11')" onmouseout = "imagesOn(Slide12Text.src, Slide12.src, 'Retreats', 'slide11')">&nbsp;&bull; Romantic Retreats</a>-->
    </div>
</div>
<div class="slideshow" style="">
    <img id="transparentImage" alt="Trip Finder Location" src="http://media.expedia.com/media/content/expus/graphics/promos/deals/blank.gif"  style="width:300px; height:200px; border:0px; top:40px; left:30px; position:absolute; top:40px; left:30px;" />
    <div id="pressboardMount" style="width:350px; height:347px; z-index:10000; position:absolute; left:0px; top:0px; filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='http://media.expedia.com/media/content/expus/graphics/promos/deals/kodak_frame.png', sizingMethod='scale');">
    </div>
    <img id="imageTitle" alt="Trip Finder Title" src="http://media.expedia.com/media/content/expus/graphics/promos/deals/blank.gif" width="367" height="40" border="0" style="" />
</div>
</div>
<div id="navHeader">Ready to go? Choose a category below:</div>
<div id="divBottomContentContainer" style="clear:both;">
<!--#include virtual="/daily/prod/common/footer.asp"-->
</div>
</html>




















