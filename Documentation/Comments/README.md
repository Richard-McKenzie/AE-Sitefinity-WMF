#Comments

##Comment Box Formatting
The scss partial contains the common styles for the base comments. These styles assume you've applied the Toggle Option for Formatting view fix.

##Removing Toggle Option For Formatting View
In order to remove the button to toggle the formatting view, copy the `MinimalToolsFile.xml` to your project under `\App_Data\Sitefinity\GlobalResources`. Then go in the admin to Administration -> Settings -> Advanced -> Appearance and change the *MinimalEditorConfiguration* value to be `~/App_Data/Sitefinity/GlobalResources/MinimalToolsFile.xml`

##TODO
 - Create out of the box fancy comments built off of the base comment.
 - Look into gravatar and more advanced styling
 - See if we can create templates for the comments.