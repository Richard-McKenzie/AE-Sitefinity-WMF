#Main Navigation 
Template for a simple main navigation. Strips out the Sitefinity and Kendo styles.

```ascx
<%@ Control Language="C#" %>
<%@ Import Namespace="Telerik.Sitefinity.Web.UI.NavigationControls.Extensions.LightNavigationControlTemplate" %>
<%@ Import Namespace="Telerik.Sitefinity.Web.UI.NavigationControls" %>

<%@ Register Assembly="Telerik.Sitefinity" TagPrefix="navigation" Namespace="Telerik.Sitefinity.Web.UI.NavigationControls" %>

<navigation:SitefinitySiteMapDataSource runat="server" ID="dataSource" />

<div class="<%= this.GetCssClass() %>">
	<ul runat="server" id="navigationUl">
		<navigation:NavigationContainer runat="server" DataSourceID="dataSource">
			<Templates>
				<navigation:NavigationTemplate>
					<Template>
						<li>
							<a runat="server" href='<%# Eval("Url") %>' target='<%# (bool)Eval("HasChildNodes") ? "" : NavigationUtilities.GetLinkTarget(Container.DataItem)%>'><%# Eval("Title") %></a>
							<ul runat="server" id="childNodesContainer"></ul>
						</li>
					</Template>
					<SelectedTemplate>
						<li class="active">
							<a runat="server" href='<%# Eval("Url") %>' target='<%# (bool)Eval("HasChildNodes") ? "" : NavigationUtilities.GetLinkTarget(Container.DataItem)%>'><%# Eval("Title") %></a>
							<ul runat="server" id="childNodesContainer"></ul>
						</li>
					</SelectedTemplate>
				</navigation:NavigationTemplate>
			</Templates>
		</navigation:NavigationContainer>
	</ul>
</div>
```