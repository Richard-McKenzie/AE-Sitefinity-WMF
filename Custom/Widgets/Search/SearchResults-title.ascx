<%@ Control Language="C#" %>
<%@ Register Assembly="Telerik.Sitefinity" Namespace="Telerik.Sitefinity.Web.UI" TagPrefix="sitefinity" %>
<%@ Register Assembly="Telerik.Sitefinity.Search.Impl" Namespace="Telerik.Sitefinity.Services.Search.Web.UI.Public" TagPrefix="sfSearch" %>

<sfSearch:SearchBox ID="topSearchBox" runat="server" />

<div class="module-list search">
	<sitefinity:SitefinityLabel id="resultsStats" runat="server" WrapperTagName="p" CssClass="sfsearchResultStatistics" Text="<%$Resources:SearchResources, SearchResultsStatusMessage %>" />
	<sitefinity:Pager ID="pager" class="pager" runat="server" />
	<asp:Repeater ID="resultsList" runat="server">
		<HeaderTemplate>
			<ul class="list">
		</HeaderTemplate>
		<ItemTemplate>
			<li class="item">
				<h2 class="title"><a runat="server" href='<%# Eval("Link")%>'><%# Eval("Title") %></a></h2>
		</ItemTemplate>
		<FooterTemplate>
			</ul>
		</FooterTemplate>
	</asp:Repeater>
</div>
<sfSearch:SearchBox ID="bottomSearchBox" runat="server" />