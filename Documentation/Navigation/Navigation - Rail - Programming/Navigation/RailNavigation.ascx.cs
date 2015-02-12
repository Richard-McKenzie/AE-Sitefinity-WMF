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
                SiteMapNode TempParentNode = !currentNode.ParentNode.Title.Equals("Pages") ? currentNode.ParentNode : currentNode;
                SiteMapNode sectionHead = null;
                
                if (TempParentNode.ParentNode != null)
                {
                    while ( !TempParentNode.ParentNode.Title.Equals("Pages"))
                    {
                        TempParentNode = TempParentNode.ParentNode; 
                    }
                }

                sectionHead = TempParentNode;

                if (sectionHead != null)
                {
                    lnkSectionHead.InnerText = sectionHead.Title;
                    lnkSectionHead.HRef = sectionHead.Url;
                }
            }
        }
    
    }
}