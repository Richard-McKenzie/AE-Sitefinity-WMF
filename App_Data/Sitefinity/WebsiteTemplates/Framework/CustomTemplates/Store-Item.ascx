<%@ Control Language="C#" %>
<%@ Import Namespace="System.ComponentModel" %>
<%@ Import Namespace="Telerik.Sitefinity.Ecommerce.Catalog.Model" %>
<%@ Register Assembly="Telerik.Sitefinity.Ecommerce" Namespace="Telerik.Sitefinity.Modules.Ecommerce.Orders.Web.UI" TagPrefix="sfOrders" %>
<%@ Register Assembly="Telerik.Sitefinity.Ecommerce" Namespace="Telerik.Sitefinity.Modules.Ecommerce.Catalog.Web.UI.Fields" TagPrefix="sfCatalog" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.ContentUI" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.PublicControls.BrowseAndEdit" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Modules.Ecommerce.Catalog.Web.UI" Assembly="Telerik.Sitefinity.Ecommerce" %>

<sf:ResourceLinks id="resourcesLinks" runat="server">
<sf:ResourceFile JavaScriptLibrary="JQueryFancyBox"/>
</sf:ResourceLinks>
<sf:ResourceLinks id="resourcesLinks2" runat="server" UseEmbeddedThemes="true" Theme="Default">
<sf:ResourceFile Name="Telerik.Sitefinity.Resources.Themes.Basic.Styles.fancybox.css" Static="true" />
</sf:ResourceLinks>

<div id="widgetStatus" runat="server" visible="false" class="sfErrorSummary sfTopMsg">
	<asp:Label ID="widgetStatusMessage" runat="server" />
</div>

<sf:ConditionalTemplateContainer ID="conditionalTemplate"  runat="server">
<Templates>
	<sf:ConditionalTemplate Left="IsActive" Operator="Equal" Right="false" runat="server">
	<asp:Literal ID="Literal1" runat="server" Text="<%$Resources:OrdersResources, ProductNotAvailable %>" />
</sf:ConditionalTemplate>

<sf:ConditionalTemplate Left="IsActive" Operator="Equal" Right="true" runat="server">
<telerik:RadListView ID="SingleItemContainer" ItemPlaceholderID="ItemContainer" AllowPaging="False" runat="server" EnableEmbeddedSkins="false" EnableEmbeddedBaseStylesheet="false">
<LayoutTemplate>
	<div class="catalog-item">
		<asp:PlaceHolder ID="ItemContainer" runat="server" />
	</div>
</LayoutTemplate>
<ItemTemplate>

	<div class="clearfix">
		<div class="grid-5">
			<div class="catalog-item-image">
				<a href='<%# HttpUtility.HtmlAttributeEncode(Eval("PrimaryImageUrl") as string) %>' class="popup">
					<img src='<%# HttpUtility.HtmlAttributeEncode(Eval("Thumbnail.Url") as string) %>' alt='<%# HttpUtility.HtmlAttributeEncode(Eval("ThumbnailAlternativeText") as string) %>' />
				</a>
			</div>
		</div>
		<div class="grid-7">
			<h1><%# Eval("Title") %></h1>
			<div class="catalog-item-buttons"><a href="#" class="btn-submit">Datasheets</a><a href="#" class="btn-submit">Contact Us</a></div>
			<div class="catalog-item-description">
				<h2 class="tagline"><%# Eval("tagline") %></h2>
				<%# Eval("Description") %>
				<asp:PlaceHolder ID="socialContainer" runat="server"></asp:PlaceHolder>
			</div>
		</div>
	</div>
	<div class="tabs">
		<div class="tab-section"><a href="#" class="tab-header">Specifications</a>
			<div class="tab-content">Tab 1 Content</div>
		</div>
		<div class="tab-section"><a href="#" class="tab-header">Accessories</a>
			<div class="tab-content">Tab 2 Content</div>
		</div>
		<div class="tab-section"><a href="#" class="tab-header">Resources</a>
			<div class="tab-content">
				<sf:ProductDocumentsAndFilesControl id="productDocumentsAndFilesControl" ProductItem='<%# Page.GetDataItem() %>' runat="server" />
			</div>
		</div>
		<div class="tab-section"><a href="#" class="tab-header">Images</a>
			<div class="tab-content">
				<ul class="sfproductImgsList">
					<asp:Repeater ID="Repeater1" runat="server" DataSource='<%# new BindingList<ProductImage>(((IEnumerable<ProductImage>)Eval("Images")).Skip(1).ToList()) %>'>
						<ItemTemplate>
							<li class="sfproductImgWrp">
								<a href='<%# DataBinder.Eval(Container.DataItem, "Url") %>' rel="fancybox" class="sfproductImgLnk">
									<asp:Image ID="Image1" CssClass="sfproductImg" runat="server" ImageUrl='<%# DataBinder.Eval(Container.DataItem, "ThumbnailUrl") %>' Width='<%# (int)DataBinder.Eval(Container.DataItem, "ThumbnailWidth") %>' Height='<%# (int)DataBinder.Eval(Container.DataItem, "ThumbnailHeight") %>' />
								</a>
							</li>
						</ItemTemplate>
					</asp:Repeater>
				</ul>
			</div>
		</div>
	</div>

	<!-- THIS NEEDS TO BE CONVERTED TO TABS -->
	<div style="display: none">
		<sf:ProductDynamicFields id="productDynamicFieldsControl" ProductItem='<%# Page.GetDataItem() %>' runat="server" />
	</div>
</ItemTemplate>
</telerik:RadListView>
</sf:ConditionalTemplate>
</Templates>
</sf:ConditionalTemplateContainer>