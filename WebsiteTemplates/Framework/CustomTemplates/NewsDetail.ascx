<%@ Control Language="C#" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.ContentUI" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.PublicControls.BrowseAndEdit"
    Assembly="Telerik.Sitefinity" %>
<telerik:RadListView ID="DetailsView" ItemPlaceholderID="ItemContainer" AllowPaging="False"
    runat="server" EnableEmbeddedSkins="false" EnableEmbeddedBaseStylesheet="false">
    <layouttemplate>
			<a href="/stadium/media/news/" class="back">Back To News</a>
			<div class="mod news-detail">
				<div class="mod-content">
					<asp:PlaceHolder ID="ItemContainer" runat="server" />
				</div>
			</div>
    </layouttemplate>
    <itemtemplate>
			<h1 class="title"><asp:Literal Text='<%# Eval("Title") %>' runat="server" /></h1>
			<div class="meta">
				<div class="meta-item"><time datetime='<sf:FieldListView ID="PublicationTime" runat="server" Format="{PublicationDate.ToLocal():yyyy-MM-dd}" />'><sf:FieldListView ID="PublicationDate" runat="server" Format="{PublicationDate.ToLocal():MMM dd, yyyy}" /></time></div>
				<sitefinity:FlatTaxonField CssClass="meta-item meta-tags" ID="FlatFieldControl" DisplayMode="Read" runat="server" WebServiceUrl="~/Sitefinity/Services/Taxonomies/FlatTaxon.svc" AllowMultipleSelection="true" TaxonomyId="CB0F3A19-A211-48a7-88EC-77495C0F5374" TaxonomyMetafieldName="Tags" Expanded="false" ExpandText="ClickToAddTags" BindOnServer="true" />
			</div>
      <sf:ContentBrowseAndEditToolbar ID="BrowseAndEditToolbar" runat="server" Mode="Edit,Delete,Unpublish"></sf:ContentBrowseAndEditToolbar>
      <sf:FieldListView ID="summary" runat="server" Text="{0}" Properties="Summary" WrapperTagName="div" WrapperTagCssClass="sfnewsSummary"  /> 
      <div class="content">
          <asp:Literal ID="Literal1" Text='<%# Eval("Content") %>' runat="server" />
      </div>

    <asp:PlaceHolder ID="socialOptionsContainer" runat="server">
  
    </asp:PlaceHolder>

        <sf:ContentView 
             id="commentsListView" 
             ControlDefinitionName="NewsCommentsFrontend"
             MasterViewName="CommentsMasterView" 
             ContentViewDisplayMode="Master"
             runat="server" />
         <sf:ContentView 
             id="commentsDetailsView" 
             ControlDefinitionName="NewsCommentsFrontend" 
             DetailViewName="CommentsDetailsView"
             ContentViewDisplayMode="Detail"
             runat="server" />
    </itemtemplate>
</telerik:RadListView>