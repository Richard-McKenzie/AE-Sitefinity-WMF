<%@ Control Language="C#" %>
<%@ Register TagPrefix="sitefinity" Assembly="Telerik.Sitefinity" Namespace="Telerik.Sitefinity.Web.UI" %>

<fieldset id="main" class="sfsearchBox" runat="server">
  <asp:TextBox ID="searchTextBox" runat="server" CssClass="sfsearchTxt" placeholder="Search" />
  <label class="sfsearchSubmit" for="searchButton">
  	<asp:Button  id="searchButton" runat="server" Text="<%$Resources:SearchResources, Search %>" OnClientClick="return false;" CssClass="sfsearchSubmit" />
  </label>
</fieldset>