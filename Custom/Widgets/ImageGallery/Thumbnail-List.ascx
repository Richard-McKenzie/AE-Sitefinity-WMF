<%@ Control Language="C#" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.ContentUI" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.PublicControls.BrowseAndEdit" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="Telerik.Sitefinity" Namespace="Telerik.Sitefinity.Modules.Comments.Web.UI.Frontend" TagPrefix="comments" %>
<%@ Import Namespace="Telerik.Sitefinity.Web.UI" %>
<%@ Import Namespace="Telerik.Sitefinity.Modules.Comments" %>

<sf:BrowseAndEditToolbar ID="browseAndEditToolbar" runat="server" Mode="Edit"></sf:BrowseAndEditToolbar>
<div class="module gallery" data-style="thumbnails">
	<sf:Pager id="pager" runat="server" class="pager"></sf:Pager>
	<sf:SitefinityLabel id="title" runat="server" WrapperTagName="h2" HideIfNoText="true" HideIfNoTextMode="Server" CssClass="title" />
	<telerik:RadListView ID="ItemsList" ItemPlaceholderID="ItemsContainer" runat="server" EnableEmbeddedSkins="false" EnableEmbeddedBaseStylesheet="false">
		<LayoutTemplate>
			<ul class="gallery-list">
				<asp:PlaceHolder ID="ItemsContainer" runat="server"/>
			</ul>
		</LayoutTemplate>
		<ItemTemplate>
			<li>
				<sf:DetailsViewHyperLink ToolTipDataField="Description" class="gallery-list-item" data-popup="false" ID="singleItemLink" style='<%# String.Format("background-image: url({0})", Eval("ThumbnailUrl")) %>' runat="server"/>

				<comments:CommentsCountControl runat="server" ID="commentsCounterControl" CssClass="gallery-list-item-comment" ThreadKey='<%# ControlUtilities.GetLocalizedKey(Eval("Id"), null, CommentsBehaviorUtilities.GetLocalizedKeySuffix(Container.DataItem.GetType().FullName)) %>' 
				ThreadType='<%# Container.DataItem.GetType().FullName %>' DisplayMode="IconOnly"/>

				<comments:CommentsAverageRatingControl runat="server" CssClass="gallery-list-item-rating" ThreadKey='<%# ControlUtilities.GetLocalizedKey(Eval("Id"), null, CommentsBehaviorUtilities.GetLocalizedKeySuffix(Container.DataItem.GetType().FullName)) %>' ThreadType='<%# Container.DataItem.GetType().FullName %>' DisplayMode="MediumText"/>
			<!-- </li> -->
		</ItemTemplate>
	</telerik:RadListView>
	<asp:PlaceHolder ID="socialContainer" runat="server"></asp:PlaceHolder>
</div>
