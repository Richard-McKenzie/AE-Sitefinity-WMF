#Custom Layouts

There are some sample layouts in the CustomLayouts folder. To use them paste this in your config file after the last </toolbox>: App_data\Sitefinity\Configuration\ToolboxesConfig.config

```
<toolbox name="PageLayouts">
	<sections>
		<add enabled="True" title="Framework Layouts" description="Base Framework regions for layout management." name="Framework">
			<tools>
				<add enabled="True" type="Telerik.Sitefinity.Web.UI.LayoutControl" title="Grid 8 (Main) - 4" description="Grid 8 (Main) - 4" cssClass="test" layoutTemplate="~/App_Data/Sitefinity/WebsiteTemplates/Framework/CustomLayouts/Grid-8-4.ascx" visibilityMode="None" name="grid-8main-4" />
				<add enabled="True" type="Telerik.Sitefinity.Web.UI.LayoutControl" title="Grid 4 - 8 (Main)" description="Grid 4 - 8 (Main)" cssClass="test" layoutTemplate="~/App_Data/Sitefinity/WebsiteTemplates/Framework/CustomLayouts/Grid-4-8.ascx" visibilityMode="None" name="grid-4-8main" />
			</tools>
		</add>
	</sections>
</toolbox>
```

###Config
- sf_cols - This allows you to click the edit button and allows you to add a class to the wrapper.
- sf_colsOut - This allows the ability to adjust column width/spacing in the admin as well as add classes to each column.
- sf_colsIn (required) - This is where content can go. 

##Basic Layout
Stripped out version of the layout control. Just allows you to change the class of the container.

```html
<div runat="server" class="sf_cols container">
	<div runat="server" class="sf_colsIn grid-8">
	</div>
	<div runat="server" class="sf_colsIn grid-4">
	</div>
</div>
```

##Sitefinity Base Layout

```html
<div runat="server" class="sf_cols container">
    <div runat="server" class="sf_colsOut grid-8">
        <div runat="server" class="sf_colsIn">
        </div>
    </div>
    <div runat="server" class="sf_colsOut grid-4">
        <div runat="server" class="sf_colsIn">
        </div>
    </div>
</div>
```