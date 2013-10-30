#Template for a normal Rail Nav

##Config
- Display 
- All sibling pages of currently opened page (recommended for rail)
- Template
- Rail Nav (Generated with the below code)
- Levels to include. This is levels from the top most displayed level. If you choose display "top-level pages" and then select 2 levels it will grab all of the first and second levels of navigation. Alternatively, if you select "All sibling pages of currently opened page" it will then grab 2 levels starting from that position in the navigation tree.

The following code with the included sass file will generate our typical rail nav.
 - Display: Top-level pages
 - Template: "Rail Nav" (new template built from below)
 - Levels to include: All

```ascx
<%@ Control Language="C#" %>
<%@ Import Namespace="Telerik.Sitefinity.Web.UI.NavigationControls.Extensions.LightNavigationControlTemplate" %>
<%@ Import Namespace="Telerik.Sitefinity.Web.UI.NavigationControls" %>

<%@ Register Assembly="Telerik.Sitefinity" TagPrefix="navigation" Namespace="Telerik.Sitefinity.Web.UI.NavigationControls" %>

<navigation:SitefinitySiteMapDataSource runat="server" ID="dataSource" />

<div class="mod nav-rail <%= this.GetCssClass() %>">
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
							<li class="active">           
								<a runat="server" href='<%# Eval("Url") %>' target='<%# NavigationUtilities.GetLinkTarget(Container.DataItem) %>'><%# Eval("Title") %></a>          
								<ul runat="server" id="childNodesContainer"></ul>
							</li>                                        
						</SelectedTemplate>
					</navigation:NavigationTemplate>
				</Templates>
			</navigation:NavigationContainer>
		</ul>
	</div>
</div>
```