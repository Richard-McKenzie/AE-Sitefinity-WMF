#Plain Image Banner
This just contains an image and a link

```ascx
<%@ Control Language="C#" %>
<%@ Register Assembly="Telerik.Sitefinity" Namespace="Telerik.Sitefinity.DynamicModules.Web.UI.Frontend" TagPrefix="sf" %>
<%@ Register Assembly="Telerik.Sitefinity" Namespace="Telerik.Sitefinity.Web.UI.Fields" TagPrefix="sf" %>
<%@ Register Assembly="Telerik.Sitefinity" Namespace="Telerik.Sitefinity.Web.UI" TagPrefix="sf" %>
<sf:DynamicDetailContainer id="detailContainer" runat="server" class="mod mod-banner">
    <LayoutTemplate>
          <a href='<%# Eval("URL")%>'>
             <sf:ImageAssetsField runat="server" DataFieldName="Image" IsThumbnail="False" />
          </a>
    </LayoutTemplate>
</sf:DynamicDetailContainer>
<asp:PlaceHolder ID="socialOptionsContainer" runat="server"></asp:PlaceHolder>
```