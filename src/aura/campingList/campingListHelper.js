({
    
    updateItem: function(component, item) {
        this.saveItem(component, item);
    },
    
    saveItem: function(component, item, callback) {
        var action = component.get("c.saveItem");
        console.log("Name of item to save: " + item.Name);
        action.setParams({
            "item": item
        });
        if (callback) {
            action.setCallback(this, callback);
        }
        console.log(action.getParam("item"));
        $A.enqueueAction(action);
    }
})