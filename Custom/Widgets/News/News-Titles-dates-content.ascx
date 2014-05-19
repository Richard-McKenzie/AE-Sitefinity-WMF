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
				<article class="news module" itemscope="" itemtype="http://schema.org/NewsArticle" data-sf-id='<%# Eval("Id")%>'>
					<h1 class="title" itemprop="name"><%# Eval("Title") %></h1>
					<ul class="meta">
						<%-- Publication Date --%>
						<li class="meta-item date" itemprop="dateCreated">
							<time datetime='<sf:FieldListView ID="PublicationTime" runat="server" Format="{PublicationDate.ToLocal():yyyy-MM-dd}" />'><sf:FieldListView ID="PublicationDate" runat="server" Format="{PublicationDate.ToLocal():MMM d, yyyy}" /></time>

						<%-- Author field --%>
						<sf:Conditional If='<%# Eval("Author").ToString().Trim() != string.Empty %>' runat="server">
							<Then>
								<li class='meta-item author' itemprop="author"><%-- Removing whitespace
									--%><asp:Literal Text="<%$ Resources:Labels, By %>" runat="server" /> 
									<sf:PersonProfileView runat="server" />
							</Then>
						</sf:Conditional>

						<%-- Citization and Source --%>
						<sf:Conditional If='<%# Eval("SourceName").ToString().Trim() != string.Empty %>' runat="server">
							<Then>
								<li class='meta-item citization' itemprop='citization'><a href='<%# Eval("SourceSite") %>' target='_blank'><%# Eval("SourceName") %></a>
							</Then>
						</sf:Conditional>

						<%-- Tags --%>
						<sitefinity:FlatTaxonField ID="FlatFieldControl" Class="meta-item tags" DisplayMode="Read" runat="server" WebServiceUrl="~/Sitefinity/Services/Taxonomies/FlatTaxon.svc" AllowMultipleSelection="true" TaxonomyId="CB0F3A19-A211-48a7-88EC-77495C0F5374" WrapperTag="li" TaxonomyMetafieldName="Tags" Expanded="false" ExpandText="ClickToAddTags" BindOnServer="true" HideWhenNoTaxaFound="true"  />
					</ul>
					<sf:ContentBrowseAndEditToolbar ID="BrowseAndEditToolbar" runat="server" Mode="Edit,Delete,Unpublish"></sf:ContentBrowseAndEditToolbar>
					<%-- Summary only shows if the client enters one, should probably style it --%>
					<sf:FieldListView ID="summary" runat="server" Text="{0}" Properties="Summary" WrapperTagName="div" WrapperTagCssClass="summary"  />
					<div class="content" itemprop="text">
						<%# Eval("Content") %>
					</div>

					<asp:PlaceHolder ID="socialOptionsContainer" runat="server"></asp:PlaceHolder>

					<%-- Removing comments from news
					<sf:ContentView id="commentsListView" ControlDefinitionName="NewsCommentsFrontend" MasterViewName="CommentsMasterView" ContentViewDisplayMode="Master" runat="server" />
					
					<sf:ContentView id="commentsDetailsView" ControlDefinitionName="NewsCommentsFrontend" DetailViewName="CommentsDetailsView" ContentViewDisplayMode="Detail" runat="server" />--%>
				</article>
			</li>
		</ItemTemplate>
	</telerik:RadListView>
	<asp:PlaceHolder ID="socialOptionsContainer" runat="server" />
</div>