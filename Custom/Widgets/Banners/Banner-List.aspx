<%@ Control Language="C#" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.PublicControls.BrowseAndEdit" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.ContentUI" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.Comments" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.Fields" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI" Assembly="Telerik.Sitefinity" %>     
<%@ Register Assembly="Telerik.Sitefinity" Namespace="Telerik.Sitefinity.Web.UI.PublicControls" TagPrefix="sf" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Import Namespace="Telerik.Sitefinity.Web.UI" %>
<sf:SitefinityLabel id="title" runat="server" WrapperTagName="div" HideIfNoText="true" HideIfNoTextMode="Server" CssClass="sfitemFieldLbl" />
<telerik:RadListView ID="dynamicContentListView" ItemPlaceholderID="ItemsContainer" runat="server" EnableEmbeddedSkins="false" EnableEmbeddedBaseStylesheet="false">
	<LayoutTemplate>
		<div class="banner-rotate">
			<asp:PlaceHolder ID="ItemsContainer" runat="server" />
		</div>
	</LayoutTemplate>
	<ItemTemplate>
		<sf:Conditional If='<%# Eval("Link").ToString().Trim() != string.Empty %>' runat="server">
			<Then>
				<a href="<%# Eval("Link")%>" <%# string.Format(Eval("NewWindow").ToString().Trim() == "True" ? "target='_blank'" : "") %> class="banner">
			</Then>
			<Else>
				<div class="banner" data-sf-id="<%# Eval("Id")%>">
			</Else>
		</sf:Conditional>
			<figure class="media">
				<sf:ImageControl runat="server" Title="" UrlKeyPrefix=""  ProviderName="OpenAccessDataProvider" >
					<RelatedDataDefinition RelatedFieldName="Image" RelatedItemType="Telerik.Sitefinity.DynamicTypes.Model.Banners.Banner" RelationTypeToDisplay="Child" RelatedItemSource="DataItemContainer">
					</RelatedDataDefinition>
				</sf:ImageControl>
			</figure>
			<sf:Conditional If='<%# Eval("BannerText").ToString().Trim() != string.Empty %>' runat="server">
				<Then>
					<div class="content">
						<%# Eval("BannerText")%>
					</div>
				</Then>
			</sf:Conditional>
		<sf:Conditional If='<%# Eval("Link").ToString().Trim() != string.Empty %>' runat="server">
			<Then>
				</a>
			</Then>
			<Else>
				</div>
			</Else>
		</sf:Conditional>
	</ItemTemplate>
</telerik:RadListView>
<!-- <sf:Pager id="pager" runat="server"></sf:Pager> -->
<asp:PlaceHolder ID="socialOptionsContainer" runat="server"></asp:PlaceHolder>