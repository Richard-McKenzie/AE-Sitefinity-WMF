#Template for a normal Rail Nav

```HTML
<%@ Control Language="C#" %>
<%@ Import Namespace="Telerik.Sitefinity.Web.UI.NavigationControls.Extensions.LightNavigationControlTemplate" %>
<%@ Import Namespace="Telerik.Sitefinity.Web.UI.NavigationControls" %>

<%@ Register Assembly="Telerik.Sitefinity" TagPrefix="navigation" Namespace="Telerik.Sitefinity.Web.UI.NavigationControls" %>
<%@ Register Assembly="Telerik.Sitefinity" TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI" %>

<sf:ResourceLinks runat="server" UseEmbeddedThemes="true" Theme="Basic">
    <sf:ResourceFile Name="Telerik.Sitefinity.Resources.Themes.Basic.Styles.nav.widget.css" Static="true" />
    <sf:ResourceFile Name="Telerik.Sitefinity.Resources.Scripts.Kendo.styles.kendo_common_min.css" Static="true" />
    <sf:ResourceFile JavaScriptLibrary="JQuery" />
    <sf:ResourceFile JavaScriptLibrary="KendoWeb" />
</sf:ResourceLinks>

<navigation:SitefinitySiteMapDataSource runat="server" ID="dataSource" />

<div class="sfNavWrp sfNavTreeviewWrp <%= this.GetCssClass() %>">
    <%-- responsive design section - renders templates for the responsive design--%>
    <navigation:NavTransformationTemplate runat="server" TransformationName="ToToggleMenu" TemplateName="ToggleMenu" />
    <navigation:NavTransformationTemplate runat="server" TransformationName="ToDropDown" TemplateName="Dropdown" />
    <%-- end of the responsive design section --%>

    <ul class="sfNavTreeview sfNavList" runat="server" id="navigationUl">
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

<%-- link to Kendo documentation http://demos.kendoui.com/web/treeview/index.html --%>

<script type="text/javascript">
    (function ($) {
        var kendoTreeView = $('.sfNavTreeview').not('div.k-treeview .sfNavTreeview').kendoTreeView({
            animation: false
        }).data('kendoTreeView');
        kendoTreeView.expand(kendoTreeView.element.find(".k-item"));
    })(jQuery);
</script>
```

