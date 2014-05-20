using System;
using System.Linq;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Telerik.Sitefinity;
using Telerik.Sitefinity.Libraries.Model;
using Telerik.Sitefinity.Web.UI;
using Telerik.Sitefinity.Model;

namespace SitefinityWebApp.Widgets.PhotoLightBox
{
    /// <summary>
    /// Class used to create custom page widget
    /// </summary>
    /// <remarks>
    /// If this widget is a part of a Sitefinity module,
    /// you can register it in the site's toolbox by adding this to the module's Install/Upgrade method(s):
    /// initializer.Installer
    ///     .Toolbox(CommonToolbox.PageWidgets)
    ///         .LoadOrAddSection(SectionName)
    ///             .SetTitle(SectionTitle) // When creating a new section
    ///             .SetDescription(SectionDescription) // When creating a new section
    ///             .LoadOrAddWidget<PhotoLightBox>("PhotoLightBox")
    ///                 .SetTitle("PhotoLightBox")
    ///                 .SetDescription("PhotoLightBox")
    ///                 .LocalizeUsing<ModuleResourceClass>() //Optional
    ///                 .SetCssClass(WidgetCssClass) // You can use a css class to add an icon (Optional)
    ///             .Done()
    ///         .Done()
    ///     .Done();
    /// </remarks>
    /// <see cref="http://www.sitefinity.com/documentation/documentationarticles/user-guide/widgets"/>
    [Telerik.Sitefinity.Web.UI.ControlDesign.ControlDesigner(typeof(SitefinityWebApp.Widgets.PhotoLightBox.Designer.PhotoLightBoxDesigner))]
    public class PhotoLightBox : SimpleView
    {
        #region Properties
        /// <summary>
        /// Gets or sets the message that will be displayed in the label.
        /// </summary>
        //public string Message { get; set; }

        /// <summary>
        /// Gets or sets the message that will be displayed in the label.
        /// </summary>
        public string Images { get; set; }

        /// <summary>
        /// Obsolete. Use LayoutTemplatePath instead.
        /// </summary>
        protected override string LayoutTemplateName
        {
            get
            {
                return string.Empty;
            }
        }

        /// <summary>
        /// Gets the layout template's relative or virtual path.
        /// </summary>
        public override string LayoutTemplatePath
        {
            get
            {
                if (string.IsNullOrEmpty(base.LayoutTemplatePath))
                    return PhotoLightBox.layoutTemplatePath;
                return base.LayoutTemplatePath;
            }
            set
            {
                base.LayoutTemplatePath = value;
            }
        }
        #endregion

        #region Control References
        /// <summary>
        /// Reference to the Label control that shows the Message.
        /// </summary>
        //protected virtual Label MessageLabel
        //{
        //    get
        //    {
        //        return this.Container.GetControl<Label>("MessageLabel", true);
        //    }
        //}

        protected virtual Repeater rptLightBox
        {
            get
            {
                return this.Container.GetControl<Repeater>("rptLightBox", true);
            }
        }

        protected virtual Repeater rptTmbLightBox
        {
            get
            {
                return this.Container.GetControl<Repeater>("rptTmbLightBox", true);
            }
        }

        #endregion

        #region Methods
        /// <summary>
        /// Initializes the controls.
        /// </summary>
        /// <param name="container"></param>
        /// <remarks>
        /// Initialize your controls in this method. Do not override CreateChildControls method.
        /// </remarks>
        protected override void InitializeControls(GenericContainer container)
        {
            Repeater rptLightBox = this.rptLightBox;
            //var album = App.WorkWith().Albums().Get().Where(c => c.Id.ToString() == this.Images).FirstOrDefault();
            var album = App.WorkWith().Albums()
                .FirstThat(a => a.Id.ToString().ToLower() == this.Images.ToLower()
                    || a.Title.ToString().ToLower() == Images.ToLower());
            
            //if (album != null && album.ChildContentItems.Count() > 0)
            //{
            //    rptLightBox.DataSource = album.ChildContentItems.Where(c => c.Visible);
            //    rptLightBox.ItemDataBound +=rptLightBox_ItemDataBound;
            //    rptLightBox.DataBind();
            //}

            if (album != null)
            {
                rptLightBox.DataSource = album.Images().Where(c => c.Visible).OrderBy(c => c.Ordinal).Get();
                rptLightBox.ItemDataBound += rptLightBox_ItemDataBound;
                rptLightBox.DataBind();

                //rptTmbLightBox
                rptTmbLightBox.DataSource = album.Images().Where(c => c.Visible).OrderBy(c => c.Ordinal).Get();
                rptTmbLightBox.ItemDataBound += rptTmbLightBox_ItemDataBound;
                rptTmbLightBox.DataBind();
            }
        }

        void rptTmbLightBox_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType != ListItemType.AlternatingItem && e.Item.ItemType != ListItemType.Item)
                return;

            MediaContent contentItem = (MediaContent)e.Item.DataItem;

            if (contentItem != null)
            {
                HtmlImage img = (HtmlImage)e.Item.FindControl("img");
                img.Attributes.Add("data-src", contentItem.ThumbnailUrl);
                img.Attributes.Add("alt", contentItem.Title);
            }
        }

        void rptLightBox_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType != ListItemType.AlternatingItem && e.Item.ItemType != ListItemType.Item)
                return;

            MediaContent contentItem = (MediaContent)e.Item.DataItem;

            if (contentItem != null)
            {
                Literal ltlTitle = (Literal)e.Item.FindControl("ltlTitle");
                HtmlImage img = (HtmlImage)e.Item.FindControl("img");

                ltlTitle.Text = contentItem.Title;
                img.Attributes.Add("data-src", contentItem.Url);
                img.Attributes.Add("alt", contentItem.Title);
            }
        }
        #endregion

        #region Private members & constants
        public static readonly string layoutTemplatePath = "~/Widgets/PhotoLightBox/PhotoLightBox.ascx";
        #endregion
    }
}
