<%@ Control Language="C#" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.PublicControls.BrowseAndEdit" Assembly="Telerik.Sitefinity" %>

<div class="faq module-rail">
	<telerik:RadListView id="listsControl" runat="server" ItemPlaceholderId="ListContainer" EnableEmbeddedSkins="false" EnableEmbeddedBaseStylesheet="false">
	<LayoutTemplate>
			<asp:PlaceHolder id="ListContainer" runat="server" />
	</LayoutTemplate>
	<ItemTemplate>
		<div class="module-header">
			<h2 class="title">
				<a href="/faq/"><asp:Literal runat="server" Text='<%# Eval("Title") %>' /></a>
			</h2>
		</div>
		<telerik:RadListView 	ID="listItemsControl"	runat="server"	ItemPlaceholderID="ItemsContainer"	EnableEmbeddedSkins="false"	EnableEmbeddedBaseStylesheet="false">
		<LayoutTemplate>
			<ul class="list">
				<asp:PlaceHolder ID="ItemsContainer" runat="server" />
			</ul>
		</LayoutTemplate>
		<ItemTemplate>
			<li class="item">
				<a href="/faq#<%# Eval("Id")%>"><%# Eval("Title") %></a>
			</li>
		</ItemTemplate>
	</telerik:RadListView>
	</ItemTemplate>
	</telerik:RadListView>
	<asp:PlaceHolder ID="socialOptionsContainer" runat="server" />
</div>