using System;
using System.Linq;
using System.Web.UI;
using Telerik.Sitefinity.Web.UI;
using Telerik.Sitefinity.Web.UI.ControlDesign;
using System.Collections.Generic;
using Telerik.Sitefinity;
using Telerik.Sitefinity.Libraries.Model;

namespace SitefinityWebApp.Widgets.ImageGallery.Designer
{
    /// <summary>
    /// Represents a designer for the <typeparamref name="SitefinityWebApp.Widgets.PhotoLightBox.PhotoLightBox"/> widget
    /// </summary>
    public class PhotoGalleryDesigner : ControlDesignerBase
    {
        #region Properties
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
                    return PhotoGalleryDesigner.layoutTemplatePath;
                return base.LayoutTemplatePath;
            }
            set
            {
                base.LayoutTemplatePath = value;
            }
        }

        protected override HtmlTextWriterTag TagKey
        {
            get
            {
                return HtmlTextWriterTag.Div;
            }
        }
        #endregion

        #region Control references
        /// <summary>
        /// Gets the control that is bound to the Message property
        /// </summary>
        //protected virtual Control Message
        //{
        //    get
        //    {
        //        return this.Container.GetControl<Control>("Message", true);
        //    }
        //}

        protected virtual Control Images
        {
            get
            {
                return this.Container.GetControl<Control>("ddlImages", true);
            }
        }

        #endregion

        #region Methods
        protected override void InitializeControls(Telerik.Sitefinity.Web.UI.GenericContainer container)
        {
            // Place your initialization logic here
            System.Web.UI.WebControls.DropDownList ddlImages 
                = this.Container.GetControl<System.Web.UI.WebControls.DropDownList>("ddlImages", true);

            //get all image libraries
            var albums = App.WorkWith().Albums().Get();

            foreach (Album child in albums)
            {
                System.Web.UI.WebControls.ListItem li = new System.Web.UI.WebControls.ListItem();
                li.Text = child.Title;
                li.Value = child.Id.ToString();
                ddlImages.Items.Add(li);
            }
        }
        #endregion

        #region IScriptControl implementation
        /// <summary>
        /// Gets a collection of script descriptors that represent ECMAScript (JavaScript) client components.
        /// </summary>
        public override System.Collections.Generic.IEnumerable<System.Web.UI.ScriptDescriptor> GetScriptDescriptors()
        {
            var scriptDescriptors = new List<ScriptDescriptor>(base.GetScriptDescriptors());
            var descriptor = (ScriptControlDescriptor)scriptDescriptors.Last();

            //descriptor.AddElementProperty("message", this.Message.ClientID);
            descriptor.AddElementProperty("images", this.Images.ClientID);

            return scriptDescriptors;
        }

        /// <summary>
        /// Gets a collection of ScriptReference objects that define script resources that the control requires.
        /// </summary>
        public override System.Collections.Generic.IEnumerable<System.Web.UI.ScriptReference> GetScriptReferences()
        {
            var scripts = new List<ScriptReference>(base.GetScriptReferences());
            scripts.Add(new ScriptReference(PhotoGalleryDesigner.scriptReference));
            return scripts;
        }
        #endregion

        #region Private members & constants
        public static readonly string layoutTemplatePath = "~/Custom/Widgets/ImageGallery/Designer/PhotoGalleryDesigner.ascx";
        public const string scriptReference = "~/Custom/Widgets/ImageGallery/Designer/PhotoGalleryDesigner.js";
        #endregion
    }
}
 
