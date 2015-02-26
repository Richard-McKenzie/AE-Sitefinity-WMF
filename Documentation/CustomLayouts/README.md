#Custom Layouts

There are some sample layouts in the CustomLayouts folder. To use them paste this in your config file after the last `</toolbox>`: App_data\Sitefinity\Configuration\ToolboxesConfig.config

```xml
<toolbox name="PageLayouts">
	<sections>
		<add enabled="True" title="Framework Layouts" description="Base Framework regions for layout management." name="Framework">
			<tools>
				<add title="Grid 4 - 8" description="Grid 4 - 8" layoutTemplate="~/App_Data/Sitefinity/WebsiteTemplates/Framework/CustomLayouts/Grid-4-8.ascx" visibilityMode="None" name="grid-4-8" enabled="True" type="Telerik.Sitefinity.Web.UI.LayoutControl" />
			</tools>
		</add>
	</sections>
</toolbox>
```

###Config
- sf_cols - This allows you to click the edit button and allows you to add a class to the wrapper.
- sf_colsOut - This allows the ability to adjust column width/spacing in the admin as well as add classes to each column.
- sf_colsIn (required) - This is where content can go. 

###Oddities and Bugs
 - When you edit the CustomLayout file, you need to go back into the page template that it's used on and save the page to refresh the CustomLayout.
 - If you add a new layout, you'll need the admin to recognize it. This is done by just loading up Settings -> Administration -> Toolboxes -> PageLayouts -> Framework -> Tools . Just by loading up this page it will recognize your new layout.

##Sitefinity Base Layout

```ascx
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