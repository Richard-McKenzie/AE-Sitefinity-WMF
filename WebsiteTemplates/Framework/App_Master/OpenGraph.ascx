<%@ Control Language="C#" %>

<%@ Register Assembly="Telerik.Sitefinity" Namespace="Telerik.Sitefinity" TagPrefix="sf" %>
<%@ Register Assembly="Telerik.Sitefinity" Namespace="Telerik.Sitefinity.Web" TagPrefix="sf" %>
<%@ Register Assembly="Telerik.Sitefinity" Namespace="Telerik.Sitefinity.Model" TagPrefix="sf" %>
<%@ Register Assembly="Telerik.Sitefinity" Namespace="Telerik.Sitefinity.Events.Model" TagPrefix="sf" %>
<%@ Register Assembly="Telerik.Sitefinity" Namespace="Telerik.Sitefinity.DynamicModules.Model" TagPrefix="sf" %>
<%@ Register Assembly="Telerik.Sitefinity" Namespace="Telerik.Sitefinity.Model.ContentLinks" TagPrefix="sf" %>
<%@ Register Assembly="Telerik.Sitefinity" Namespace="Telerik.Sitefinity.Modules.Libraries" TagPrefix="sf" %>

<% if(!this.IsBackend() && !this.IsDesignMode()) { %>

<script runat="server">
    SiteMapNode currentNode = Telerik.Sitefinity.Web.SiteMapBase.GetActualCurrentNode();
    string ogImageIcon =  "/Sitefinity/WebsiteTemplates/Framework/App_Themes/Framework/Icons/apple-touch-icon-400x400.png";  
</script>

<meta property="og:title" content="<%=Page.Title%>" />
<meta property="og:image" content="http://<%= Request.Url.Authority + ogImageIcon %>" />
<meta property="og:type" content="website" />
<meta property="og:url" content="<%=Request.Url%>" />
<meta property="og:description" content="<%= currentNode.Description %>" />
<% } %>