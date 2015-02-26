<%@ Control Language="C#" %>

<%@ Register Assembly="Telerik.Sitefinity" Namespace="Telerik.Sitefinity" TagPrefix="sf" %>
<%@ Register Assembly="Telerik.Sitefinity" Namespace="Telerik.Sitefinity.Web" TagPrefix="sf" %>
<%@ Register Assembly="Telerik.Sitefinity" Namespace="Telerik.Sitefinity.Model" TagPrefix="sf" %>
<%@ Register Assembly="Telerik.Sitefinity" Namespace="Telerik.Sitefinity.Events.Model" TagPrefix="sf" %>
<%@ Register Assembly="Telerik.Sitefinity" Namespace="Telerik.Sitefinity.DynamicModules.Model" TagPrefix="sf" %>
<%@ Register Assembly="Telerik.Sitefinity" Namespace="Telerik.Sitefinity.Model.ContentLinks" TagPrefix="sf" %>
<%@ Register Assembly="Telerik.Sitefinity" Namespace="Telerik.Sitefinity.Modules.Libraries" TagPrefix="sf" %>

<!-- OpenGraph START -->
<% if(!this.IsBackend() && !this.IsDesignMode()) { %>

<script runat="server">
    SiteMapNode currentNode = Telerik.Sitefinity.Web.SiteMapBase.GetActualCurrentNode();
    string ogImageIcon =  "/Sitefinity/WebsiteTemplates/Framework/App_Themes/Framework/Icons/apple-touch-icon-400x400.png";  
</script>

<meta property="og:title" content="<%=Page.Title%>" />
<% if (currentNode.Url.Equals("~/event"))
   {

       string lastNode = Request.Path.Split('/').Last();
       Event e = App
                .WorkWith()
                .Events()
                .Where(evt => evt.UrlName.Equals(lastNode))
                .First()
                .GetLive()
                .Get();
       string evtImageSquare = e.GetValue("MediaWallCoverImage").ToString().Replace(".tmb-", "");
       string evtImageWide = e.GetValue("EventBanner").ToString().Replace(".tmb-","");
       ogImageIcon = "http://" + Request.Url.Authority + ogImageIcon;
       string ogImageEvent = evtImageSquare != String.Empty ?
                            evtImageSquare : evtImageWide != String.Empty ?
                                             evtImageWide :  ogImageIcon;   
%>
<meta property="og:image" content="<%=  ogImageEvent %>" />
<meta property="og:type" content="event" />
<meta property="og:url" content="<%=Request.Url%>" />
<meta property="event:start_time" content="<%= e != null && e.EventStart != null ? e.EventStart.ToLocalTime().ToString("yyyy-MM-ddThh:mm") : "" %>" />
<% if (e != null && e.EventEnd.HasValue)
   { %>
<meta property="event:end_time" content="<%= e.EventEnd.Value.ToString("yyyy-MM-ddThh:mm")  %>" />
<% } %>
<meta property="og:description" content="<%= e.GetValue("InfoInfo").ToString() %>" />
<% }
   else
   { %>
<meta property="og:image" content="http://<%= Request.Url.Authority + ogImageIcon %>" />
<meta property="og:type" content="website" />
<meta property="og:url" content="<%=Request.Url%>" />
<meta property="og:description" content="<%= currentNode.Description %>" />
<% } %>
<% } %>
<!-- OpenGraph END -->