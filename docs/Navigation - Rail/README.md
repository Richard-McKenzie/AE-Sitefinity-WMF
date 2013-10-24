#Template for a normal Rail Nav

```HTML
<%@ Control Language="C#" %>
<%@ Import Namespace="Telerik.Sitefinity.Web.UI.NavigationControls.Extensions.LightNavigationControlTemplate" %>
<%@ Import Namespace="Telerik.Sitefinity.Web.UI.NavigationControls" %>

<%@ Register Assembly="Telerik.Sitefinity" TagPrefix="navigation" Namespace="Telerik.Sitefinity.Web.UI.NavigationControls" %>
<%@ Register Assembly="Telerik.Sitefinity" TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI" %>

<navigation:SitefinitySiteMapDataSource runat="server" ID="dataSource" />

<nav class="mod nav-rail <%= this.GetCssClass() %>">
	<div class="mod-content">
    <ul class="nav-rail-list" runat="server" id="navigationUl">
        <navigation:NavigationContainer runat="server" DataSourceID="dataSource">
            <Templates>
                  <navigation:NavigationTemplate>
                        <Template>
                            <li>           
                                <a runat="server" href='<%# Eval("Url") %>' target='<%# NavigationUtilities.GetLinkTarget(Container.DataItem) %>'><%# Eval("Title") %></a>          
                                <ul runat="server" id="childNodesContainer"></ul>
                            </li>                                        
                        </Template>
                      <SelectedTemplate>
                            <li>           
                                <a runat="server" href='<%# Eval("Url") %>' class="sfSel" target='<%# NavigationUtilities.GetLinkTarget(Container.DataItem) %>'><%# Eval("Title") %></a>          
                                <ul runat="server" id="childNodesContainer"></ul>
                            </li>                                        
                        </SelectedTemplate>
                    </navigation:NavigationTemplate>
                </Templates>
        </navigation:NavigationContainer>
    </ul>
	</div>
</nav>
```

