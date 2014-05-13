<%@ Control Language="C#" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.ContentUI" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.PublicControls.BrowseAndEdit"
Assembly="Telerik.Sitefinity" %>
<%@ Register Assembly="Telerik.Sitefinity" Namespace="Telerik.Sitefinity.Modules.Comments.Web.UI.Frontend" TagPrefix="comments" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Import Namespace="Telerik.Sitefinity.Web.UI" %>
<%@ Import Namespace="Telerik.Sitefinity.Modules.Comments" %>

<div class="module gallery">
	<sf:BrowseAndEditToolbar ID="browseAndEditToolbar" runat="server" Mode="Edit"></sf:BrowseAndEditToolbar>
	<sf:SitefinityLabel id="title" runat="server" WrapperTagName="h2" HideIfNoText="true" HideIfNoTextMode="Server" CssClass="title" />
	<telerik:RadListView ID="ItemsList" ItemPlaceholderID="ItemsContainer" runat="server" EnableEmbeddedSkins="false" EnableEmbeddedBaseStylesheet="false">
	<layouttemplate>
		<ul class="gallery-list">
			<asp:PlaceHolder ID="ItemsContainer" runat="server"/>
		</ul>
	</layouttemplate>
	<itemtemplate>
		<li>      
			<sf:SitefinityHyperLink runat="server" class="gallery-list-item" id="singleItemLink" />
			<comments:CommentsCountControl runat="server" ID="commentsCounterControl" CssClass="gallery-list-item-comment"
			ThreadKey='<%# ControlUtilities.GetLocalizedKey(Eval("Id"), null, CommentsBehaviorUtilities.GetLocalizedKeySuffix(Container.DataItem.GetType().FullName)) %>' 
			ThreadType='<%# Container.DataItem.GetType().FullName %>' 
			DisplayMode="IconOnly"/>

			<comments:CommentsAverageRatingControl runat="server" CssClass="gallery-list-item-rating"
			ThreadKey='<%# ControlUtilities.GetLocalizedKey(Eval("Id"), null, CommentsBehaviorUtilities.GetLocalizedKeySuffix(Container.DataItem.GetType().FullName)) %>' 
			ThreadType='<%# Container.DataItem.GetType().FullName %>' 
			DisplayMode="MediumText"/>
		</li>
	</itemtemplate>
	</telerik:RadListView>
	<sf:Pager id="pager" runat="server"></sf:Pager>
	<asp:PlaceHolder ID="socialContainer" runat="server"></asp:PlaceHolder>
</div>