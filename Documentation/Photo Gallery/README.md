#Image Gallery



##Thumbnail + Detail 
Bugged, need to get the detail url figured out as we're using a custom background image. For the mean time we're just fixing this with javascript.

##Photo Gallery
Note: This is currently a separate module called Photo Gallery as there's a bug in Sitefinity that won't allow us to style the Image Gallery Template

Style changes that we could look at doing is make the top image a background-cover effect with a zoom icon that they can click to show the full image.

[12:01:08 PM] Taha Zouhair: If you do this on an ascx `<%@ Register Assembly="SitefinityWebApp" TagPrefix="sf" Namespace="SitefinityWebApp.Widgets.ImageGallery.PhotoGallery" %>`
[12:01:38 PM] Taha Zouhair: `<sf:PhotoGallery id="pg1" runat="server" Images="Album Name Here" />`
[12:02:04 PM] Taha Zouhair: It would work too. Images can be either an Album Name or the Album Id. I'm searching across both with an OR condition