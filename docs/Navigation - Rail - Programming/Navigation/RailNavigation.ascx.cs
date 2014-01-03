using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Sitefinity.Modules.Pages;
using Telerik.Sitefinity.Pages.Model;
using Telerik.Sitefinity.Web;

namespace SitefinityWebApp.Custom.Navigation
{
    public partial class RailNavigation : System.Web.UI.UserControl
    {
        public string currentURL { get; set; }

        protected void Page_Init(object sender, EventArgs e)
        {
            if ((SiteMapBase.GetCurrentProvider()).CurrentNode != null)
            {
                PageNode currentPage = new PageManager().GetPageNode(new Guid(SiteMapBase.GetCurrentProvider().CurrentNode.Key));
                this.currentURL = SiteMapBase.GetCurrentNode().GetUrl(Thread.CurrentThread.CurrentCulture).Replace("~", "");
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (currentURL != null)
            {
                SiteMapNode currentNode = SiteMapBase.GetCurrentNode();
                SiteMapNode sectionHead = null;
                SiteMapNode TempParentNode = null;

                while (sectionHead == null)
                {
                    TempParentNode = TempParentNode != null ? TempParentNode.ParentNode : currentNode.ParentNode;
                    if (TempParentNode.ParentNode.Url.Replace("~", "").Equals("/"))
                    {
                        sectionHead = TempParentNode;
                    }
                }

                if (sectionHead != null)
                {
                    lnkSectionHead.InnerText = sectionHead.Title;
                    lnkSectionHead.HRef = sectionHead.Url;
                }
            }
        }
    
    }
}