Sitefinity
==========

To get started go [here](./docs/README.md) for directions

##TODO

 - Make a generic style for the framework, remove site specific styles from the code
 - Provide more examples, add everything to the sandbox.
 - Redo custom layouts
 - Find a good jquery validator
 - Document form updates with the placeholder and form type
 - Explain legacy browser support and policy
 - WYSIWYG styles: http://www.sitefinity.com/blogs/gabe-sumners-blog/2011/09/23/my_3_favorite_customizations_to_sitefinity_rsquo_s_rich_text_editor
 - explain `<%# string.Format(Eval("SourceName").ToString().Trim() != string.Empty ? "<div class='meta-item citization' itemprop='citization'><a href='{0}' target='_blank'>{1}</a></div>" : "", Eval("SourceSite"), Eval("SourceName")) %>`

##Time
http://msdn.microsoft.com/en-us/library/8kb3ddd4(v=vs.110).aspx

##Tags

```<%-- Tags, Currently doesn't hide if no tags :( --%>
<sitefinity:FlatTaxonField CssClass="meta-item meta-tags" ID="FlatFieldControl" DisplayMode="Read" runat="server" WebServiceUrl="~/Sitefinity/Services/Taxonomies/FlatTaxon.svc" AllowMultipleSelection="true" TaxonomyId="CB0F3A19-A211-48a7-88EC-77495C0F5374" TaxonomyMetafieldName="Tags" Expanded="false" ExpandText="ClickToAddTags" BindOnServer="true" />```

```<%# string.Format(Eval("Author").ToString().Trim() != string.Empty ? "" : "hidden", Eval("Author")) %>```

```

    <sf:Conditional If='<%# Eval("TestField") %>' runat="server">
    <Then>
        <div class="article_reclame">
    print something if yes
   </div>                                   
    </Then>
    <Else>
        <div>
     print something else if no
   </div>
    </Else>
</sf:Conditional>
```
```
<asp:HyperLink NavigateUrl='<%# Eval("GoogleMapUrl")%>' Visible='<%# string.IsNullOrEmpty(Eval("GoogleMapUrl").ToString()) ? false : true %>' Text="Directions to It!" runat="server" />
```

Repository of various Sitefinity tools and modules

Sandbox: http://sitefinitybox.idevdesign.net/
Sandbox Sf 7: http://sitefinity7-demo.idevdesign.net/


##Changelog

**v 0.1.1** - 3/11/2014
 - Added pagination enhancement
 - enhanced form sass partial
 - added instructions on how to update css
 - bunch of small bug fixes/renaming

**v 0.1** - 3/3/2014
 - Added better support for a pages MetaData.
 - Renamed lingering boilerplate names and changed it to Framework.
 - Updated config.rb
 - Various javascript cleanup and upgrading plugins
 - Standardize sass naming conventions and file organization
 - Renamed some css classes to make them more global and logical (e.g. btn to button, mod to module)
 - Added better base styles for forms
 - Reorganized menu partial to be a bit more usable
 - Added more generic styles for widgets:  faq, fixed grid, modules, newsletter, page-meta, pagination, search, sitemap.
 - Added more generic templates for widgets: Blog, FAQ, NewsRail, Testimonials.
 - Expanded some of the docs.

**v 0** - Early 2014
 - Framework makes it's appearance on github.