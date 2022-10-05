event MyEvent(address indexed _from, string s1, string s2);

function _EmitEvent(event _EventName, _param1, _param2) internal {
    _EventName(_param1, _param2);    
}

function publicFunc() public {
    _EmitEvent(MyEvent, 'hello', 'world');
}
