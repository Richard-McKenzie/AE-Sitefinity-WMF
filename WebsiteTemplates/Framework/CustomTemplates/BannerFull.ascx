<%@ Control Language="C#" %>
<%@ Register Assembly="Telerik.Sitefinity" Namespace="Telerik.Sitefinity.DynamicModules.Web.UI.Frontend" TagPrefix="sf" %>
<%@ Register Assembly="Telerik.Sitefinity" Namespace="Telerik.Sitefinity.Web.UI.Fields" TagPrefix="sf" %>
<%@ Register Assembly="Telerik.Sitefinity" Namespace="Telerik.Sitefinity.Web.UI" TagPrefix="sf" %>
<%@ Register Assembly="Telerik.Sitefinity" Namespace="Telerik.Sitefinity.Modules.Comments.Web.UI.Frontend" TagPrefix="sf" %>
<%@ Import Namespace="Telerik.Sitefinity.Web.UI" %>
<sf:DynamicDetailContainer class="mod mod-banner" id="detailContainer" runat="server">
	<LayoutTemplate>
		<a href="<%# Eval("URL")%>" <%# string.Format(Eval("isNewWindow").ToString().Trim() != "True" ? "" : "target='_blank'") %>>
			<sf:ImageAssetsField runat="server" DataFieldName="Image" IsThumbnail="False" />
		</a>
	</LayoutTemplate>
</sf:DynamicDetailContainer>
<asp:PlaceHolder ID="socialOptionsContainer" runat="server"></asp:PlaceHolder>