<%@ Control Language="C#" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.ContentUI" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.Comments" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.PublicControls.BrowseAndEdit" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.PublicControls" Assembly="Telerik.Sitefinity" %>

<%-- Leaving this title in here, no idea how it triggers --%>
<sf:SitefinityLabel id="title" runat="server" WrapperTagName="div" HideIfNoText="true" HideIfNoTextMode="Server" /> 
<telerik:RadListView ID="NewsList" ItemPlaceholderID="ItemsContainer" runat="server" EnableEmbeddedSkins="false" EnableEmbeddedBaseStylesheet="false">
	<LayoutTemplate>
		<div class="module-list news-list">
			<ul class="list">
				<asp:PlaceHolder ID="ItemsContainer" runat="server" />
			</ul>
		</div>
	</LayoutTemplate>
	<ItemTemplate>
		<li class="item" data-sf-id='<%# Eval("Id")%>'>
			<figure class="aside">
				<sf:ImageControl runat="server" Title="" UrlKeyPrefix=""  ProviderName="OpenAccessDataProvider" >
					<RelatedDataDefinition RelatedFieldName="FeaturedImage" RelatedItemType="Telerik.Sitefinity.News.Model.NewsItem" RelationTypeToDisplay="Child" RelatedItemSource="DataItemContainer">
					</RelatedDataDefinition>
				</sf:ImageControl>
			</figure>
			<div class="item-content">
				<h2 class="title">
					<sf:DetailsViewHyperLink TextDataField="Title" ToolTipDataField="Description" data-sf-field="Title" data-sf-ftype="ShortText" runat="server" />
				</h2>
				<div class="meta">
					<div class="meta-item date">
						<time datetime='<sf:FieldListView ID="PublicationTime" runat="server" Format="{PublicationDate.ToLocal():yyyy-MM-dd}'" />"><sf:FieldListView ID="PublicationDate" runat="server" Format="{PublicationDate.ToLocal():MMM d, yyyy}" /></time>
					</div>
				</div>
				<sf:FieldListView ID="summary" runat="server" Text="{0}" Properties="Summary" WrapperTagName="div" WrapperTagCssClass="summary" EditableFieldType="ShortText"/> 
				<sf:DetailsViewHyperLink ID="FullStory" Text="<%$ Resources:NewsResources, FullStory %>" runat="server" CssClass="more" />
			</div>
		</li>
	</ItemTemplate>
</telerik:RadListView>
<sf:Pager id="pager" runat="server"></sf:Pager>
<asp:PlaceHolder ID="socialOptionsContainer" runat="server" />