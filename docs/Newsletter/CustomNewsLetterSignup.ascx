<%@ Control Language="C#" %>
<%@ Register TagPrefix="sitefinity" Namespace="Telerik.Sitefinity.Web.UI" Assembly="Telerik.Sitefinity" %>

<asp:Panel ID="errorsPanel" runat="server" CssClass="sfErrorSummary" Visible="false" />
<fieldset id="formFieldset" runat="server" class="sfnewsletterForm sfSubscribe">
	<sitefinity:SitefinityLabel id="widgetTitle" runat="server" WrapperTagName="h2" HideIfNoText="true" CssClass="sfnewsletterTitle" />
	<sitefinity:SitefinityLabel id="widgetDescription" runat="server" WrapperTagName="p" HideIfNoText="true" CssClass="sfnewsletterDescription" />
	<sitefinity:Message ID="messageControl" runat="server" FadeDuration="3000" />

	<asp:Label ID="emailAddressLabel" runat="server" Text='<%$Resources:NewslettersResources, EmailAddress %>' AssociatedControlID="emailAddress" CssClass="sfTxtLbl visuallyhidden" />
	<asp:TextBox ID="emailAddress" runat="server" CssClass="sfTxt" />

	<asp:Button ID="subscribeButton" runat="server" Text='Submit' ValidationGroup="subscribeForm" CssClass="button" />

	<asp:RequiredFieldValidator ID="emailValidator" runat="server" ControlToValidate="emailAddress" ValidationGroup="subscribeForm" CssClass="sfErrorWrp" Display="Dynamic">
		<strong class="sfError"><asp:Literal runat="server" ID="lEmailIsRequired" Text='<%$Resources:NewslettersResources, EmailIsRequired %>' /></strong>
	</asp:RequiredFieldValidator>
	<asp:RegularExpressionValidator ID="emailRegExp" runat="server" ControlToValidate="emailAddress" ValidationGroup="subscribeForm" ValidationExpression="[a-zA-Z0-9._%+-]+@(?:[a-zA-Z0-9-]+\.)+[a-zA-Z]{2,4}" Display="Dynamic" CssClass="sfErrorWrp" ErrorMessage="<%$ Resources:ErrorMessages, EmailAddressViolationMessage %>"> 
		<strong class="sfError"><asp:Literal ID="lEmailNotValid" runat="server" Text="<%$ Resources:ErrorMessages, EmailAddressViolationMessage %>" /></strong>
	</asp:RegularExpressionValidator>

	<!-- <asp:Label ID="firstNameLabel" runat="server" Text='<%$Resources:NewslettersResources, FirstNamePublicForm %>' AssociatedControlID="firstName" CssClass="sfTxtLbl" />
		<asp:TextBox ID="firstName" runat="server" CssClass="sfTxt" /> -->
	<!-- <asp:Label ID="lastNameLabel" runat="server" Text='<%$Resources:NewslettersResources, LastNamePublicForm %>' AssociatedControlID="lastName" CssClass="sfTxtLbl" />
		<asp:TextBox ID="lastName" runat="server" CssClass="sfTxt" /> -->
</fieldset>

<asp:Panel ID="selectListInstructionPanel" runat="server">
<asp:Literal ID="pleaseSelectList" runat="server" Text='<%$Resources:NewslettersResources, ClickEditAndSelectList %>' />
</asp:Panel>