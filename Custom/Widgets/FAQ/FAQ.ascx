<%@ Control Language="C#" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.PublicControls.BrowseAndEdit"
Assembly="Telerik.Sitefinity" %>
<div class="faq module">
	<telerik:RadListView id="listsHeaderControl" runat="server" ItemPlaceholderId="PlaceHolder1" EnableEmbeddedSkins="false" EnableEmbeddedBaseStylesheet="false">
		<layouttemplate>
			<div class="faq-legend">
				<asp:PlaceHolder ID="PlaceHolder1" runat="server" />
			</div>
		</layouttemplate>
		<itemtemplate>	
			<%-- I don't think we need this, should be using the h1 on the content block for this.
			<h2 class="title"><a href='#<%# Eval("Id")  %>'><%# Eval("Title") %></a></h2>
			--%>
			<telerik:RadListView ID="listItemsHeaderControl" runat="server" ItemPlaceholderID="PlaceHolder2" EnableEmbeddedSkins="false" EnableEmbeddedBaseStylesheet="false">
				<LayoutTemplate>
					<ol>
						<asp:PlaceHolder ID="PlaceHolder2" runat="server" />
					</ol>
				</LayoutTemplate>
				<ItemTemplate>
					<li class="item">
						<a href='#<%# Eval("Id")  %>'><asp:Literal runat='server' Text='<%# Eval("Title") %>'/></a>
					</li>
				</ItemTemplate>
			</telerik:RadListView>
		</itemtemplate>
	</telerik:RadListView>
	<asp:PlaceHolder ID="socialOptionsContainer" runat="server" />

	<telerik:RadListView id="listsControl" runat="server" ItemPlaceholderId="ListContainer"	EnableEmbeddedSkins="false" EnableEmbeddedBaseStylesheet="false">
		<layouttemplate>
			<div class="faq-details">
				<asp:PlaceHolder id="ListContainer" runat="server" />
			</div>
		</layouttemplate>
		<itemtemplate>
			<%-- I don't know if we need this. Since we don't have categories show up here this seems to just duplicate the title. Going to hide it for now --%>
			<!--<h2 class="title" id="<%# Eval("Id") %>">
				<asp:Literal runat="server" Text='<%# Eval("Title") %>' />
			</h2>-->
			<telerik:RadListView ID="listItemsControl" runat="server" ItemPlaceholderID="ItemsContainer" EnableEmbeddedSkins="false" EnableEmbeddedBaseStylesheet="false">
				<LayoutTemplate>
					<ol class="list">
						<asp:PlaceHolder ID="ItemsContainer" runat="server" />
					</ol>
				</LayoutTemplate>
				<ItemTemplate>
					<li class="item">
						<h3 class="title" id="<%# Eval("Id") %>">
							<asp:Literal ID="title" runat="server" Text='<%# Eval("Title") %>' />
						</h3>
						<div class="content">
							<asp:Literal ID="content" runat="server" Text='<%# Eval("Content") %>' />
						</div>
						<sf:ContentBrowseAndEditToolbar ID="BrowseAndEditToolbar" runat="server" Mode="Edit,Delete,Unpublish"></sf:ContentBrowseAndEditToolbar>
						<a class="top" href='#main'><asp:Literal runat='server' Text='<%$ Resources:Labels, Top %>'/></a>
					</li>
				</ItemTemplate>
			</telerik:RadListView>
		</itemtemplate>
	</telerik:RadListView>
</div>