#News Detail

```ascx
<%@ Control Language="C#" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.ContentUI" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.PublicControls.BrowseAndEdit"
    Assembly="Telerik.Sitefinity" %>
<telerik:RadListView ID="DetailsView" ItemPlaceholderID="ItemContainer" AllowPaging="False"
    runat="server" EnableEmbeddedSkins="false" EnableEmbeddedBaseStylesheet="false">
    <layouttemplate>
        <div class="sfnewsDetails">
            <%-- <div class="sfnewsLinksWrp">
                <sf:MasterViewHyperLink class="sfnewsBack" Text="<%$ Resources:NewsResources, AllNews %>" runat="server" />
            </div> --%>
            <asp:PlaceHolder ID="ItemContainer" runat="server" />
        </div>
    </layouttemplate>
    <itemtemplate>
        <h1 class="title">
            <asp:Literal Text='<%# Eval("Title") %>' runat="server" />
        </h1>
        <div class="meta">
        	<div class="meta-item">
            <asp:Literal Text="<%$ Resources:Labels, By %>" runat="server" /> <sf:PersonProfileView runat="server" />
          </div>
          <div class="meta-item">
            <sf:FieldListView ID="PublicationDate" runat="server" Format="{PublicationDate.ToLocal():MMM dd, yyyy}" />
          </div>
        </div>
        <sf:ContentBrowseAndEditToolbar ID="BrowseAndEditToolbar" runat="server" Mode="Edit,Delete,Unpublish"></sf:ContentBrowseAndEditToolbar>
        <sf:FieldListView ID="summary" runat="server" Text="{0}" Properties="Summary" WrapperTagName="div" WrapperTagCssClass="sfnewsSummary"  /> 
        <div class="sfnewsContent">
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
```
