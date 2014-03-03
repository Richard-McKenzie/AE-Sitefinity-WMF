<%@ Control Language="C#" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.ContentUI" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.PublicControls.BrowseAndEdit"
Assembly="Telerik.Sitefinity" %>
<%@ Import Namespace="Telerik.Sitefinity" %>

<sf:ResourceLinks id="resourcesLinks" runat="server">
<sf:ResourceFile JavaScriptLibrary="JQuery"/>
</sf:ResourceLinks>

<sf:ResourceLinks id="resourcesLinks2" runat="server" UseEmbeddedThemes="true" Theme="Default">
<sf:ResourceFile Name="Telerik.Sitefinity.Resources.Themes.Basic.Styles.icons.css" Static="true" />
</sf:ResourceLinks>
<asp:Repeater ID="Repeater" runat="server">
<HeaderTemplate>
	<div class="module blog-overview">
	<ul class="module-list">

</HeaderTemplate>
<ItemTemplate>
	<li class="item">
		<h2 class="title">
			<asp:HyperLink ID="blogPageUrl" runat="server" />
			<asp:Label ID="blogPageName" runat="server"></asp:Label>
			<asp:PlaceHolder ID="errorPanel" runat="server" Visible="false">
			<span class="sftoggleErrorWrp">
				<div class="sftoggleErrorLnk">There is a problem with this blog settings</div>
				<sf:SitefinityLabel id="errorLabel" runat="server" WrapperTagName="strong" Text="<%$ Resources:BlogResources, DefaultPageNotSet %>"  CssClass="sftoggleError" style="display: none;" />
			</span>
		</asp:PlaceHolder>
	</h2>
	<div class="meta">
		<div class="meta-item date">
			<asp:Literal runat="server" ID="lastPost" Text="<%$ Resources:BlogResources, LastPostLiteral %>" />
			<strong><asp:Literal runat="server" ID="blogDateModified" /></strong>
		</div>
	</div>
</li>
</ItemTemplate>
<FooterTemplate>
</ul>
	</div>
</FooterTemplate>
</asp:Repeater>

<script type="text/javascript">
	jQuery(".sftoggleErrorLnk").click(function () {
		jQuery(this).next(".sftoggleError").toggle();
	});
</script>