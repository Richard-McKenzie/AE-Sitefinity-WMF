<%@ Control Language="C#" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.ContentUI" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.PublicControls.BrowseAndEdit" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<sf:BrowseAndEditToolbar ID="browseAndEditToolbar" runat="server" Mode="Edit"></sf:BrowseAndEditToolbar>
<telerik:RadListView ID="ItemsList" ItemPlaceholderID="ItemsContainer" runat="server" EnableEmbeddedSkins="false" EnableEmbeddedBaseStylesheet="false">
	<LayoutTemplate>
		<ul class="gallery">
			<asp:PlaceHolder ID="ItemsContainer" runat="server"/>
		</ul>
	</LayoutTemplate>
	<ItemTemplate>
		<li>
			<sf:SitefinityHyperLink CssClass="gallery-item" data-popup="true" runat="server" rel='<%# String.Format("{0}_mainImageGallery", this.ClientID) %>' id="singleItemLink"/>
		</li>
	</ItemTemplate>
</telerik:RadListView>
<sf:Pager id="pager" runat="server"></sf:Pager>
<asp:PlaceHolder ID="socialContainer" runat="server"></asp:PlaceHolder>