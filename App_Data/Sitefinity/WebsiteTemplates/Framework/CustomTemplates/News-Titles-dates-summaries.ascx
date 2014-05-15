<%@ Control Language="C#" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.ContentUI" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.Comments" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.PublicControls.BrowseAndEdit" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.PublicControls" Assembly="Telerik.Sitefinity" %>


<div class="news module-list">
	<sf:Pager id="pager" class="pager" runat="server"></sf:Pager>
	<%-- Leaving this title in here, no idea how it triggers --%>
	<sf:SitefinityLabel id="title" runat="server" WrapperTagName="div" HideIfNoText="true" HideIfNoTextMode="Server" /> 
	<telerik:RadListView ID="NewsList" ItemPlaceholderID="ItemsContainer" runat="server" EnableEmbeddedSkins="false" EnableEmbeddedBaseStylesheet="false">
		<LayoutTemplate>
				<ul class="list">
					<asp:PlaceHolder ID="ItemsContainer" runat="server" />
				</ul>
		</LayoutTemplate>
		<ItemTemplate>
			<li class="item" data-sf-id='<%# Eval("Id")%>'>
				<%-- Use this aside for images, calendar, or other media. Remove entire tag if not needed --%>
				<figure class="aside">
					<sf:ImageControl runat="server" Title="" UrlKeyPrefix=""  ProviderName="OpenAccessDataProvider" >
						<RelatedDataDefinition RelatedFieldName="FeaturedImage" RelatedItemType="Telerik.Sitefinity.News.Model.NewsItem" RelationTypeToDisplay="Child" RelatedItemSource="DataItemContainer">
						</RelatedDataDefinition>
					</sf:ImageControl>
				</figure>

				<div class="item-content">

					<%-- Title --%>
					<h2 class="title">
						<sf:DetailsViewHyperLink TextDataField="Title" ToolTipDataField="Description" data-sf-field="Title" data-sf-ftype="ShortText" runat="server" />
					</h2>
					<ul class="meta">

						<%-- Date --%>
						<li class="meta-item date">
							<time datetime='<sf:FieldListView ID="PublicationTime" runat="server" Format="{PublicationDate.ToLocal():yyyy-MM-dd}'" />"><sf:FieldListView ID="PublicationDate" runat="server" Format="{PublicationDate.ToLocal():MMM d, yyyy}" /></time>
						</li>

						<%-- Tags --%>
						<sitefinity:FlatTaxonField ID="FlatFieldControl" Class="meta-item tags" DisplayMode="Read" runat="server" WebServiceUrl="~/Sitefinity/Services/Taxonomies/FlatTaxon.svc" AllowMultipleSelection="true" TaxonomyId="CB0F3A19-A211-48a7-88EC-77495C0F5374" WrapperTag="li" TaxonomyMetafieldName="Tags" Expanded="false" ExpandText="ClickToAddTags" BindOnServer="true" HideWhenNoTaxaFound="true"  />
					</ul>

					<%-- Summary --%>
					<sf:FieldListView ID="summary" runat="server" Text="{0}" Properties="Summary" WrapperTagName="div" WrapperTagCssClass="summary" EditableFieldType="ShortText"/> 

					<%-- More Link --%>
					<sf:DetailsViewHyperLink ID="FullStory" Text="<%$ Resources:NewsResources, FullStory %>" runat="server" CssClass="more" />

				</div>
			</li>
		</ItemTemplate>
	</telerik:RadListView>
	<asp:PlaceHolder ID="socialOptionsContainer" runat="server" />
</div>