<%@ Control Language="C#" %>
<%@ Register Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Telerik.Sitefinity" Namespace="Telerik.Sitefinity.Web.UI" TagPrefix="sf" %>

<div class="sfBreadcrumbWrp">
    <sf:SitefinityLabel id="BreadcrumbLabel" runat="server" WrapperTagName="span" HideIfNoText="true" CssClass="sfBreadcrumbLabel" />
    <telerik:RadSiteMap runat="server" ID="Breadcrumb" Skin="Sitefinity">
        <DefaultLevelSettings ListLayout-RepeatDirection="Horizontal" Layout="Flow"/>
    </telerik:RadSiteMap>
</div>