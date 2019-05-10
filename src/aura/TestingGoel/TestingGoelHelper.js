({
      // Fetch the accounts from the Apex controller
      getTestingData: function(component) {
        var action = component.get('c.getTestingData');
        // Set up the callback
        var self = this;
        action.setCallback(this, function(actionResult) {
         component.set('v.testData', actionResult.getReturnValue());
        });
        $A.enqueueAction(action);
      }
    })