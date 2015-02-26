<%@ Control Language="C#" %>
<%@ Register Assembly="Telerik.Sitefinity" Namespace="Telerik.Sitefinity.DynamicModules.Web.UI.Frontend" TagPrefix="sf" %>      
<%@ Register Assembly="Telerik.Sitefinity" Namespace="Telerik.Sitefinity.Web.UI.Fields" TagPrefix="sf" %>      
<%@ Register Assembly="Telerik.Sitefinity" Namespace="Telerik.Sitefinity.Web.UI" TagPrefix="sf" %>      
<%@ Register Assembly="Telerik.Sitefinity" Namespace="Telerik.Sitefinity.Modules.Comments.Web.UI.Frontend" TagPrefix="sf" %>      
<%@ Register Assembly="Telerik.Sitefinity" Namespace="Telerik.Sitefinity.Modules.Libraries.Web.UI" TagPrefix="sf" %>      
<%@ Register Assembly="Telerik.Sitefinity" Namespace="Telerik.Sitefinity.Web.UI.PublicControls" TagPrefix="sf" %>
<%@ Import Namespace="Telerik.Sitefinity.Web.UI" %>
<sf:SitefinityLabel id="title" runat="server" WrapperTagName="div" HideIfNoText="true" HideIfNoTextMode="Server" CssClass="sfitemFieldLbl" />
<sf:DynamicDetailContainer id="detailContainer" runat="server">
	<LayoutTemplate>
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
	</LayoutTemplate>
</sf:DynamicDetailContainer>
<asp:PlaceHolder ID="socialOptionsContainer" runat="server"></asp:PlaceHolder>