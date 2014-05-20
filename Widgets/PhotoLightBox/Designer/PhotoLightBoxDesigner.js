Type.registerNamespace("SitefinityWebApp.Widgets.PhotoLightBox.Designer");

SitefinityWebApp.Widgets.PhotoLightBox.Designer.PhotoLightBoxDesigner = function (element) {
    /* Initialize Message fields */
    //this._message = null;
    this._images = null;

    /* Calls the base constructor */
    SitefinityWebApp.Widgets.PhotoLightBox.Designer.PhotoLightBoxDesigner.initializeBase(this, [element]);
}

SitefinityWebApp.Widgets.PhotoLightBox.Designer.PhotoLightBoxDesigner.prototype = {
    /* --------------------------------- set up and tear down --------------------------------- */
    initialize: function () {
        /* Here you can attach to events or do other initialization */
        SitefinityWebApp.Widgets.PhotoLightBox.Designer.PhotoLightBoxDesigner.callBaseMethod(this, 'initialize');
    },
    dispose: function () {
        /* this is the place to unbind/dispose the event handlers created in the initialize method */
        SitefinityWebApp.Widgets.PhotoLightBox.Designer.PhotoLightBoxDesigner.callBaseMethod(this, 'dispose');
    },

    /* --------------------------------- public methods ---------------------------------- */

    findElement: function (id) {
        var result = jQuery(this.get_element()).find("#" + id).get(0);
        return result;
    },

    /* Called when the designer window gets opened and here is place to "bind" your designer to the control properties */
    refreshUI: function () {
        var controlData = this._propertyEditor.get_control(); /* JavaScript clone of your control - all the control properties will be properties of the controlData too */

        /* RefreshUI Message */
        //jQuery(this.get_message()).val(controlData.Message);
        //jQuery(this.get_images()).val(controlData.ddlImages);
        jQuery("#ddlImages").val(controlData.Images);
    },

    /* Called when the "Save" button is clicked. Here you can transfer the settings from the designer to the control */
    applyChanges: function () {
        var controlData = this._propertyEditor.get_control();

        /* ApplyChanges Message */
        //controlData.Message = jQuery(this.get_message()).val();
        controlData.Images = jQuery("#ddlImages").val();
    },

    /* --------------------------------- event handlers ---------------------------------- */

    /* --------------------------------- private methods --------------------------------- */

    /* --------------------------------- properties -------------------------------------- */

    /* Message properties */
    //get_message: function () { return this._message; }, 
    //set_message: function (value) { this._message = value; },
    get_images: function () { return this._images; }, 
    set_images: function (value) { this._images = value; }
}

SitefinityWebApp.Widgets.PhotoLightBox.Designer.PhotoLightBoxDesigner.registerClass('SitefinityWebApp.Widgets.PhotoLightBox.Designer.PhotoLightBoxDesigner', Telerik.Sitefinity.Web.UI.ControlDesign.ControlDesignerBase);
