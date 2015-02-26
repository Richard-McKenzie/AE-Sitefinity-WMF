using System;
using System.Linq;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Telerik.Sitefinity;
using Telerik.Sitefinity.Libraries.Model;
using Telerik.Sitefinity.Web.UI;
using Telerik.Sitefinity.Model;

namespace SitefinityWebApp.Widgets.ImageGallery.PhotoGallery
{
    [Telerik.Sitefinity.Web.UI.ControlDesign.ControlDesigner(typeof(SitefinityWebApp.Widgets.ImageGallery.Designer.PhotoGalleryDesigner))]
    public class PhotoGallery : SimpleView
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
                    return PhotoGallery.layoutTemplatePath;
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
            
            var album = App.WorkWith().Albums()
                .FirstThat(a => a.Id.ToString().ToLower() == this.Images.ToLower()
                    || a.Title.ToString().ToLower() == Images.ToLower());
            
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
                HtmlGenericControl img = (HtmlGenericControl)e.Item.FindControl("img");

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
        public static readonly string layoutTemplatePath = "~/Custom/Widgets/ImageGallery/PhotoGallery.ascx";
        #endregion
    }
}
