<%@ Control Language="C#" %>
<%@ Register Assembly="Telerik.Sitefinity" Namespace="Telerik.Sitefinity.Web.UI" TagPrefix="sitefinity" %>
<%@ Register Assembly="Telerik.Sitefinity.Search.Impl" Namespace="Telerik.Sitefinity.Services.Search.Web.UI.Public" TagPrefix="sfSearch" %>

<sfSearch:SearchBox ID="topSearchBox" runat="server" />

<sitefinity:SitefinityLabel id="resultsStats" runat="server" WrapperTagName="p" CssClass="sfsearchResultStatistics" Text="<%$Resources:SearchResources, SearchResultsStatusMessage %>" />

<asp:Repeater ID="resultsList" runat="server">
	<HeaderTemplate>
		<div class="module search-results">
			<div class="module-content">
				<ul class="module-list">
	</HeaderTemplate>
	<ItemTemplate>
		<li class="item clearfix">
			<h2 class="title"><a runat="server" href='<%# Eval("Link")%>'><%# Eval("Title") %></a></h2>
			<%--<div class="desc"><%# Eval("Summary")%></div>--%>
			<div class="desc"><%# Eval("HighLighterResult")%></div>
			<a runat="server" class="more" href='<%# Eval("Link")%>'>Read More</a>
	</ItemTemplate>
	<FooterTemplate>
				</ul>
			</div>
		</div>
	</FooterTemplate>
</asp:Repeater>
<div class="clearfix">
	<sitefinity:Pager ID="pager" class="pager" runat="server" />
</div>
<sfSearch:SearchBox ID="bottomSearchBox" runat="server" />
