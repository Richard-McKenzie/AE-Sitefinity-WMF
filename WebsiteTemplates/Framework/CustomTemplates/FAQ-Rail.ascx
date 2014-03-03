<%@ Control Language="C#" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.PublicControls.BrowseAndEdit" Assembly="Telerik.Sitefinity" %>

<div class="module faq-rail">
	<telerik:RadListView id="listsControl" runat="server" ItemPlaceholderId="ListContainer" EnableEmbeddedSkins="false"         EnableEmbeddedBaseStylesheet="false">
	<LayoutTemplate>
			<asp:PlaceHolder id="ListContainer" runat="server" />
	</LayoutTemplate>
	<ItemTemplate>
		<div class="module-head">
			<h2 class="title">
				<asp:Literal runat="server" Text='<%# Eval("Title") %>' />
			</h2>
			<a href="/about/faq/" class="more">View All</a>
		</div>
		<telerik:RadListView 	ID="listItemsControl"	runat="server"	ItemPlaceholderID="ItemsContainer"	EnableEmbeddedSkins="false"	EnableEmbeddedBaseStylesheet="false">
		<LayoutTemplate>
			<div class="module-content">
				<ul>
					<asp:PlaceHolder ID="ItemsContainer" runat="server" />
				</ul>
			</div>
		</LayoutTemplate>
		<ItemTemplate>
			<li>
				<a href="/about/faq#<%# Eval("Id")%>"><%# Eval("Title") %></a>
			</li>
		</ItemTemplate>
	</telerik:RadListView>
	</ItemTemplate>
	</telerik:RadListView>
	<asp:PlaceHolder ID="socialOptionsContainer" runat="server" />
</div>