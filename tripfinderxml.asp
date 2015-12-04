<%Response.ContentType="text/xml"%>
<!-- #include virtual=/daily/common/globalvars.asp-->
<%
sPath = Left(g_sPath, InStrRev(g_sPath, "tripfinderxml.asp") - 1) 
strXslUrl = "http://" & g_sServer & sPath & "tripfinderxsl.asp?cat=" & Request.QueryString("cat") & "&reg=" & Request.QueryString("reg")
g_oXml.async = false
g_oXml.load(Server.MapPath("tripfinder.xml"))
g_oXml.loadXml(CleanXml(g_oXml.xml))
g_oXsl.async = false
g_oXsl.loadXml(GetHttpXML(strXslUrl,"","GET",3000,3000,3000,3000))


Response.Write g_oXml.transformNode(g_oXsl)

Function CleanXml(str)
    strReturn = str
    strReturn = Replace(strReturn, "’", "'")
    CleanXml = strReturn
End Function
%>
<!-- #include virtual=/daily/common/freeres.asp-->
