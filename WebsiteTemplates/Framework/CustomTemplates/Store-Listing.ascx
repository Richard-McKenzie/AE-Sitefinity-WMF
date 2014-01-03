<%@ Control Language="C#" %>
<%@ Import Namespace="Telerik.Sitefinity.Model" %>
<%@ Register TagPrefix="sfCatalog" Namespace="Telerik.Sitefinity.Modules.Ecommerce.Catalog.Web.UI.Fields" Assembly="Telerik.Sitefinity.Ecommerce"%>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.ContentUI" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.Comments" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.PublicControls.BrowseAndEdit" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Modules.Ecommerce.Catalog.Web.UI" Assembly="Telerik.Sitefinity.Ecommerce" %>

<div id="widgetStatus" runat="server" visible="false" class="sfErrorSummary sfTopMsg">
	<asp:Label ID="widgetStatusMessage" runat="server" />
</div>

<asp:Placeholder id="widgetBody" runat="server">
<div class="clearfix">
	<div class="sfProductsSortByWrp" id="productSortControlWrp" runat="server">
		<sf:SortProductsControl ID="sortProductsControl" runat="server" />
	</div>

	<sf:TotalProductsControl runat="server" ID="totalProductsControlTop" CssClass="sfCatalogTotalCount" />

	<sf:Pager id="topPager" runat="server" DisplayCount="3" ShowPrevAndNext="true" CssClass="sfCatalogPager" />
</div>


<sf:ItemsPerPageSelector ID="itemsPerPageSelectorTop" runat="server" GroupingKey="Products" CssClass="sfitemsPerPageWrp" />

<telerik:RadListView ID="productsListView" runat="server" ItemPlaceholderID="ProductContainer" EnableEmbeddedSkins="false" EnableEmbeddedBaseStylesheet="false">
<LayoutTemplate>
	<ul class="sfproductsList">
		<asp:PlaceHolder ID="ProductContainer" runat="server" />
	</ul>
</LayoutTemplate>
<ItemTemplate>
	<li class="sfproductListItem">
		<div class="sfproductTmbWrp">
			<sf:DetailsViewHyperLink ID="thumbnailLink" runat="server" ImageUrl='<%# Eval("ThumbnailUrl") %>' Text='<%# Eval("ThumbnailAlternativeText") %>' ToolTip='<%# Eval("Title") %>' />
		</div>
		<h2 class="sfproductTitle">
			<sf:DetailsViewHyperLink Text='<%# (Eval("Title").ToString()).TruncateString(56, SitefinityExtensions.TruncateOptions.IncludeEllipsis) %>' runat="server" CssClass="sfproductTitleLnk" />
		</h2>
		<div class="sfproductSummary">
			<sitefinity:TextField runat="server" DisplayMode="Read" Value='<%# Eval("Summary")%>' />
		</div>
		<div class="sfproductLink"> 
			<sf:DetailsViewHyperLink Text='View' runat="server" />                 
		</div>
		<%--NOTE: Uncomment the next line to display custom product fields--%>
		<%--<sf:ProductDynamicFields id="productDynamicFields" runat="server"></sf:ProductDynamicFields>--%>
	</li>
</ItemTemplate>
</telerik:RadListView>
<div class="clearfix">
	<sf:TotalProductsControl runat="server" ID="totalProductsControlBottom" CssClass="sfCatalogTotalCount" />
	<sf:Pager id="pager" runat="server" DisplayCount="3" ShowPrevAndNext="true" CssClass="sfCatalogPager" />
	<sf:ItemsPerPageSelector ID="itemsPerPageSelectorBottom" runat="server" GroupingKey="Products" CssClass="sfitemsPerPageWrp" />
</div>
</asp:Placeholder>
