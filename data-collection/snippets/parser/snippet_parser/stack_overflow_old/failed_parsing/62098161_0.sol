event TestEvent (uint id);
function test() public view {
    emit TestEvent(123);
}


... TypeError: Function declared as view, but this expression (potentially) modifies the state and thus requires non-payable (the default) or payable.
...
