<%@ Control Language="C#" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.ContentUI" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.Comments" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.PublicControls.BrowseAndEdit" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>


<div class="news module-rail">
	<div class="module-header">
		<h2 class="title">News</h2>
	</div>
	<sf:Pager id="pager" runat="server" class="pager"></sf:Pager>
	<sf:SitefinityLabel id="title" runat="server" WrapperTagName="div" HideIfNoText="true" HideIfNoTextMode="Server" /> 
	<telerik:RadListView ID="NewsList" ItemPlaceholderID="ItemsContainer" runat="server" EnableEmbeddedSkins="false" EnableEmbeddedBaseStylesheet="false">
		<LayoutTemplate>
			<ul class="list">
				<asp:PlaceHolder ID="ItemsContainer" runat="server" />
			</ul>
		</LayoutTemplate>
		<ItemTemplate>
			<li class="item" data-sf-id='<%# Eval("Id")%>'>
				<h2 class="title">
					<sf:DetailsViewHyperLink TextDataField="Title" ToolTipDataField="Description" data-sf-field="Title" data-sf-ftype="ShortText" runat="server" />
				</h2>
			</li>
		</ItemTemplate>
	</telerik:RadListView>
	<asp:PlaceHolder ID="socialOptionsContainer" runat="server" />
</div>