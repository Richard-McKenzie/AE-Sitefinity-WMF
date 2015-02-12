<%@ Control Language="C#" %>
<%@ Register Assembly="Telerik.Sitefinity" Namespace="Telerik.Sitefinity.DynamicModules.Web.UI.Frontend" TagPrefix="sf" %>
<%@ Register Assembly="Telerik.Sitefinity" Namespace="Telerik.Sitefinity.Web.UI.Fields" TagPrefix="sf" %>
<%@ Register Assembly="Telerik.Sitefinity" Namespace="Telerik.Sitefinity.Web.UI" TagPrefix="sf" %>
<sf:DynamicDetailContainer id="detailContainer" runat="server" class="mod-video">
	<LayoutTemplate>
			<a href="/stadium/media/video" class="back">Back To Videos</a>
			<div class="mod-title">
				<sf:SitefinityLabel ID="mainShortTextFieldLiteral" runat="server" Text='<%# Eval("Title") %>' WrapperTagName="h1" HideIfNoText="true" CssClass="title" />
			</div>			
			<div class="mod-content">
				<div class="meta">
					<div class="meta-item"><time datetime='<sf:FieldListView ID="PublicationTime" runat="server" Format="{PublicationDate.ToLocal():yyyy-MM-dd}'" />"><sf:FieldListView ID="PublicationDate" runat="server" Format="{PublicationDate.ToLocal():MMM dd, yyyy}" /></time></div>
					<sitefinity:FlatTaxonField CssClass="meta-item meta-tags" ID="FlatFieldControl" DisplayMode="Read" runat="server" WebServiceUrl="~/Sitefinity/Services/Taxonomies/FlatTaxon.svc" AllowMultipleSelection="true" TaxonomyId="CB0F3A19-A211-48a7-88EC-77495C0F5374" TaxonomyMetafieldName="Tags" Expanded="false" ExpandText="ClickToAddTags" BindOnServer="true" />
				</div>
				<div class="video">
					<%# string.Format(Eval("YouTube").ToString().Trim() != string.Empty ? "<iframe src='//www.youtube.com/embed/{0}?rel=0&amp;showinfo=0' width='{1}' height='{2}' frameborder='0' allowfullscreen=''></iframe>" : "", Eval("YouTube"), Eval("VideoWidth"), Eval("VideoHeight")) %>

					<%# string.Format(Eval("Embed").ToString().Trim() != string.Empty ? "<video src='{0}' width='{1}' height='{2}'></video>" : "", Eval("Embed"), Eval("VideoWidth"), Eval("VideoHeight")) %>
				</div>
				<sf:SitefinityLabel runat="server" Text='<%# Eval("Description")%>' WrapperTagName="div" HideIfNoText="true" CssClass="desc" />
			</div>
	</LayoutTemplate>
</sf:DynamicDetailContainer>
<asp:PlaceHolder ID="socialOptionsContainer" runat="server"></asp:PlaceHolder>