<%@ Control Language="C#" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.ContentUI" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.PublicControls.BrowseAndEdit" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>


<div id="imagesContainer" runat="server" class="module gallery" data-style="gallery">
	<sf:BrowseAndEditToolbar ID="browseAndEditToolbar" runat="server" Mode="Edit"></sf:BrowseAndEditToolbar>
		<sf:SitefinityLabel id="title" runat="server" WrapperTagName="h2" HideIfNoText="true" HideIfNoTextMode="Server" CssClass="title" />
			<telerik:RadListView ID="ItemsList" ItemPlaceholderID="ItemsContainer" runat="server" EnableEmbeddedSkins="false" EnableEmbeddedBaseStylesheet="false">
			<LayoutTemplate>
				<asp:PlaceHolder ID="ItemsContainer" runat="server"/>  
			</LayoutTemplate>
			<ItemTemplate>    
				<sf:SitefinityHyperLink  runat="server" id="singleItemLink"/>    
			</ItemTemplate>
		</telerik:RadListView>
	<sf:Pager id="pager" runat="server"></sf:Pager>
	<asp:PlaceHolder ID=socialContainer runat=server></asp:PlaceHolder>
</div>