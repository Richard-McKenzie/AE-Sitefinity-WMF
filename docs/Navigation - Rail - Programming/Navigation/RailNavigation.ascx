<%@ Control Language="C#" AutoEventWireup="true" CodeFile="RailNavigation.ascx.cs" Inherits="SitefinityWebApp.Custom.Navigation.RailNavigation" %>

<%@ Register Assembly="Telerik.Sitefinity" TagPrefix="navigation" Namespace="Telerik.Sitefinity.Web.UI.NavigationControls" %>
<%@ Register Assembly="SitefinityWebApp" TagPrefix="CustomNav" Namespace="SitefinityWebApp.Custom.Navigation" %>

<navigation:SitefinitySiteMapDataSource ID="dataSource" runat="server" SiteMapProvider="SitefinitySiteMap"
    ShowStartingNode="false" StartFromCurrentNode="false" StartingNodeOffset="1" />

<nav class="mod nav-rail">
  <div class="mod-head">
    <h2 class="title"><a id="lnkSectionHead" href="#" runat="server">Stadium</a></h2>
  </div>

<div class="mod nav-rail">
    <div class="mod-content">  
              <ul class="nav-rail-list">
                <CustomNav:RecursiveNav ID="rl1" DataSourceID="dataSource" runat="server">
                    <HeaderTemplate><ul></HeaderTemplate>
                    <ItemHeaderTemplate><li class="<%# currentURL.Equals(Eval("Url").ToString()) ? "on " :  (currentURL.StartsWith(Eval("Url").ToString()) ? "active " : String.Empty) %>"></ItemHeaderTemplate>
                    <ItemTemplate>
                        <a href="<%# Eval("Url") %>"><%# Eval("Title") %></a>
                    </ItemTemplate>
                    <ItemFooterTemplate></li></ItemFooterTemplate>
                    <FooterTemplate></ul></FooterTemplate>
                </CustomNav:RecursiveNav>
                </ul>
    </div>
</div>
</nav>
