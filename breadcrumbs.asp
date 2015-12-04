<div id="airmail" style="background-image:url(http://media.expedia.com/media/content/expus/graphics/promos/deals/air_mail_bg.gif); width:550px; height:31px; background-repeat:no-repeat;position:absolute;left:0px;top:0px; padding-left:20px;">
    <a href="/" style="color:#330000; text-decoration:underline; font-family:Arial; font-size:10px; font-weight:normal;">Home</a> &gt;
    <a href="/daily/deals/default.asp" style="color:#330000; text-decoration:underline; font-family:Arial; font-size:10px; font-weight:normal;">Deals & Destinations</a> &gt;
    <a href="/daily/vacations/summerofadventure/default.asp" style="color:#330000; text-decoration:underline; font-family:Arial; font-size:10px; font-weight:normal;">Summer of Adventure</a> &gt;
    <%If InStr(g_sScriptName, "default.asp") > 0 Then%>
    <span style="color:#330000; font-family:Arial; font-size:10px; font-weight:normal;">Trip Finder</span> 
    <%Else%>
    <a href="/daily/vacations/summerofadventure/tripfinder/default.asp" style="color:#330000; text-decoration:underline; font-family:Arial; font-size:10px; font-weight:normal;">Trip Finder</a> &gt;
    <span style="color:#330000; font-family:Arial; font-size:10px; font-weight:normal;"><%= friendly %></span>
    <%End If%>
</div>
