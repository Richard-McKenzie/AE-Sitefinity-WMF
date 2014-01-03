<%@ Control Language="C#" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.ContentUI" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.PublicControls.BrowseAndEdit" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="Telerik.Sitefinity" Namespace="Telerik.Sitefinity.Modules.Comments.Web.UI.Frontend" TagPrefix="comments" %>
<%@ Import Namespace="Telerik.Sitefinity.Web.UI" %>

<sf:BrowseAndEditToolbar ID="browseAndEditToolbar" runat="server" Mode="Edit"></sf:BrowseAndEditToolbar>
<telerik:RadListView ID="ItemsList" ItemPlaceholderID="ItemsContainer" runat="server" EnableEmbeddedSkins="false" EnableEmbeddedBaseStylesheet="false">
  <LayoutTemplate>
    <ul class="gallery">
      <asp:PlaceHolder ID="ItemsContainer" runat="server"/>
    </ul>
  </LayoutTemplate>
  <ItemTemplate>
    <li>
      <sf:DetailsViewHyperLink CssClass="gallery-item" data-popup="false" ToolTipDataField="Description" ID="singleItemLink" runat="server"/>
      <comments:CommentsCountControl runat="server" ID="commentsCounterControl" CssClass="gallery-item-comment" ThreadKey='<%# ControlUtilities.GetLocalizedKey(Eval("Id")) %>' ThreadType='<%# Container.DataItem.GetType().FullName %>' DisplayMode="IconOnly"/>
    </li>
  </ItemTemplate>
</telerik:RadListView>
<sf:Pager id="pager" runat="server"></sf:Pager>
<asp:PlaceHolder ID="socialContainer" runat="server"></asp:PlaceHolder>
