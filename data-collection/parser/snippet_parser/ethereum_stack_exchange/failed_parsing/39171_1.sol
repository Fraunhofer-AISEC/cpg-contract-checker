assertEventOfType: function(response, eventName, index) {
    assert.equal(response.logs[index].event, eventName, eventName + ' event should fire.');
}
