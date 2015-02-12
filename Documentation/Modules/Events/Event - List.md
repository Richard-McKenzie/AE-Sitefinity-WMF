#Events List

Here's the Widget Template for the news listing that we used with (MetLife Stadium)[http://www.metlifestadium.com/events-tickets/event-calendar]. This uses some custom fields for the events so make sure you have them. Also requires custom taxonomies to be installed.

##Current and Future Events

Filter Expression `Visible = true AND Status = Live AND (EventStart >= DateTime.UtcNow OR EventEnd >= DateTime.UtcNow)`

```html
<%@ Control Language="C#" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.ContentUI" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.Comments" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.PublicControls.BrowseAndEdit" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sfContent" Namespace="Telerik.Sitefinity.Modules.Events.Web.UI.Export" Assembly="Telerik.Sitefinity.ContentModules" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="events" Namespace="Telerik.Sitefinity.Modules.Events.Web.UI.Public" Assembly="Telerik.Sitefinity.ContentModules" %>

<telerik:RadListView ID="eventsList" ItemPlaceholderID="ItemsContainer" runat="server" EnableEmbeddedSkins="false" EnableEmbeddedBaseStylesheet="false">
    <LayoutTemplate>
        <sf:ContentBrowseAndEditToolbar ID="MainBrowseAndEditToolbar" runat="server" Mode="Add"></sf:ContentBrowseAndEditToolbar>
        <div class="mod mod-events">
        	<div class="mod-content">
		        <ul class="mod-list">
	            <asp:PlaceHolder ID="ItemsContainer" runat="server" />
		        </ul>
		       </div>
        </div>
    </LayoutTemplate>
    <ItemTemplate>
        <li class="item">
          <div class="aside"><a href="/event<%# Eval("ItemDefaultUrl")%>" class="media"><img src="<%# Eval("MediaWallCoverImage")%>" alt="<%# Eval("Title")%>"><div class="postStamp"><time datetime='<sf:FieldListView ID="PublicationTime" runat="server" Format="{EventStart.ToLocal():yyyy-MM-dd}" />'><span class="postStampMonth"><sf:FieldListView ID="StartMonth" runat="server" Format="{EventStart.ToLocal():MMM}" /></span> <span class="postStampDay"><sf:FieldListView ID="StartDate" runat="server" Format="{EventStart.ToLocal():dd}" /></span></time></div></a></div>
          <div class="item-content">        
            <h2 class="title"><sf:DetailsViewHyperLink TextDataField="Title" ToolTipDataField="Description" runat="server" /></h2>
            <div class="meta">
              <sitefinity:FlatTaxonField CssClass="meta-item meta-tags" ID="FlatFieldControl" DisplayMode="Read" runat="server" WebServiceUrl="~/Sitefinity/Services/Taxonomies/FlatTaxon.svc" AllowMultipleSelection="true" TaxonomyId="CB0F3A19-A211-48a7-88EC-77495C0F5374" TaxonomyMetafieldName="Tags" Expanded="false" ExpandText="ClickToAddTags" BindOnServer="true" />
            </div>

            <sf:FieldListView ID="summary" runat="server" Text="{0}" Properties="Summary" WrapperTagName="div" WrapperTagCssClass="desc"  /> 

            <sf:DetailsViewHyperLink ToolTipDataField="Description" runat="server" CssClass="more">Read More</sf:DetailsViewHyperLink>
            <sf:ContentBrowseAndEditToolbar ID="BrowseAndEditToolbar" runat="server" Mode="Edit,Delete,Unpublish"></sf:ContentBrowseAndEditToolbar>
            <sfContent:EventExporterWidget ID="eventExporters" ShowExportControls="true" ShowIcons="true" runat="server"></sfContent:EventExporterWidget>
          </div>
        </li>
    </ItemTemplate>
</telerik:RadListView>
<div class="clearfix">
	<div class="pager-archive">
          <a href="../">Current Events</a>
	</div>
	<sf:Pager id="pager" class="pager" runat="server"></sf:Pager>
</div>
<asp:PlaceHolder ID="socialOptionsContainer" runat="server" />
```

##Event Archive

Filter Expression `Visible = true AND Status = Live AND (EventStart <= DateTime.UtcNow OR EventEnd <= DateTime.UtcNow)`

```html
<%@ Control Language="C#" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.ContentUI" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.Comments" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.PublicControls.BrowseAndEdit" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sfContent" Namespace="Telerik.Sitefinity.Modules.Events.Web.UI.Export" Assembly="Telerik.Sitefinity.ContentModules" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="events" Namespace="Telerik.Sitefinity.Modules.Events.Web.UI.Public" Assembly="Telerik.Sitefinity.ContentModules" %>

<telerik:RadListView ID="eventsList" ItemPlaceholderID="ItemsContainer" runat="server" EnableEmbeddedSkins="false" EnableEmbeddedBaseStylesheet="false">
    <LayoutTemplate>
        <sf:ContentBrowseAndEditToolbar ID="MainBrowseAndEditToolbar" runat="server" Mode="Add"></sf:ContentBrowseAndEditToolbar>
        <div class="mod mod-events">
        	<div class="mod-content">
		        <ul class="mod-list">
	            <asp:PlaceHolder ID="ItemsContainer" runat="server" />
		        </ul>
		       </div>
        </div>
    </LayoutTemplate>
    <ItemTemplate>
        <li class="item">
          <div class="aside"><a href="/event<%# Eval("ItemDefaultUrl")%>" class="media"><img src="<%# Eval("MediaWallCoverImage")%>" alt="<%# Eval("Title")%>"><div class="postStamp"><time datetime='<sf:FieldListView ID="PublicationTime" runat="server" Format="{EventStart.ToLocal():yyyy-MM-dd}" />'><span class="postStampMonth"><sf:FieldListView ID="StartMonth" runat="server" Format="{EventStart.ToLocal():MMM}" /></span> <span class="postStampDay"><sf:FieldListView ID="StartDate" runat="server" Format="{EventStart.ToLocal():dd}" /></span></time></div></a></div>
          <div class="item-content">        
            <h2 class="title"><sf:DetailsViewHyperLink TextDataField="Title" ToolTipDataField="Description" runat="server" /></h2>
            <div class="meta">
              <sitefinity:FlatTaxonField CssClass="meta-item meta-tags" ID="FlatFieldControl" DisplayMode="Read" runat="server" WebServiceUrl="~/Sitefinity/Services/Taxonomies/FlatTaxon.svc" AllowMultipleSelection="true" TaxonomyId="CB0F3A19-A211-48a7-88EC-77495C0F5374" TaxonomyMetafieldName="Tags" Expanded="false" ExpandText="ClickToAddTags" BindOnServer="true" />
            </div>

            <sf:FieldListView ID="summary" runat="server" Text="{0}" Properties="Summary" WrapperTagName="div" WrapperTagCssClass="desc"  /> 

            <sf:DetailsViewHyperLink ToolTipDataField="Description" runat="server" CssClass="more">Read More</sf:DetailsViewHyperLink>
            <sf:ContentBrowseAndEditToolbar ID="BrowseAndEditToolbar" runat="server" Mode="Edit,Delete,Unpublish"></sf:ContentBrowseAndEditToolbar>
            <sfContent:EventExporterWidget ID="eventExporters" ShowExportControls="true" ShowIcons="true" runat="server"></sfContent:EventExporterWidget>
          </div>
        </li>
    </ItemTemplate>
</telerik:RadListView>
<div class="clearfix">
	<div class="pager-archive">
          <a href="../">Current Events</a>
	</div>
	<sf:Pager id="pager" class="pager" runat="server"></sf:Pager>
</div>
<asp:PlaceHolder ID="socialOptionsContainer" runat="server" />
```
