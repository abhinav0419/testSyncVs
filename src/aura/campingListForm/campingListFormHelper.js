({
	createItem: function(component, newItem) {
        var createEvent = component.getEvent("addItem");
        createEvent.setParams({ "item": newItem });
        createEvent.fire();
        component.set("v.newItem", 
                      {'sobjectType' : 'Camping_Item__c',
                       'Name' : '',
                       'Quantity__c' : 0,
                       'Price__c' : 0,
                       'Packed__c' : false});
    },
    
    validateCampingListForm: function(component) {
    
        // Simplistic error checking
        var validItem = true;
    
        // Name must not be blank
        var nameField = component.find("itemName");
        var name = nameField.get("v.value");
        console.log("Name: " + name);
        if ($A.util.isEmpty(name)){
            validItem = false;
            nameField.set("v.errors", [{message:"Expense name can't be blank."}]);
        }
        else {
            nameField.set("v.errors", null);
        }
    
        // Amount must be set, must be a positive number
        var quantityField = component.find("quantity");
        var quantity = quantityField.get("v.value");
        console.log("quantity: " + quantity);
        if ($A.util.isEmpty(quantity) || isNaN(quantity) || (quantity <= 0.0)){
            validItem = false;
            quantityField.set("v.errors", [{message:"Enter an quantity amount."}]);
        }
        else {
            // If the amount looks good, unset any errors...
            quantityField.set("v.errors", null);
        }
        
        var priceField = component.find("price");
        var price = priceField.get("v.value");
        console.log("price: " + price);

        if ($A.util.isEmpty(price) || isNaN(price) || (price <= 0.0)){
            validItem = false;
            priceField.set("v.errors", [{message:"Enter an price amount."}]);
        }
        else {
            // If the amount looks good, unset any errors...
            priceField.set("v.errors", null);
        }
        
        return(validItem);
    }
})