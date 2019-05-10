({
    clickCreateItem: function(component, event, helper) {
        if(helper.validateCampingListForm(component)){
            var newItem = component.get("v.newItem");
            helper.createItem(component, newItem);
        }
    }
})