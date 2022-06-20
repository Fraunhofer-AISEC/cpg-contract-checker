pragma solidity 0.4.23;

interface EventHandler {
    function handleEvent(uint256 value) external;
}

contract EventEmitter {

    EventHandler[] public eventHandlers;

    function emitEvent(uint256 _value) public {
        for(uint256 i = 0; i < eventHandlers.length; i++){
            eventHandlers[i].handleEvent(_value);
        }
    }

    function registerHandler(EventHandler _handler) public {
        
        eventHandlers.push(_handler);
    }
}


contract SomeContract is EventHandler {
    uint256 public value;

    constructor(EventEmitter _emitter) public {
        _emitter.registerHandler(this);
    }

    function handleEvent(uint256 _value) external {
        value = _value;
        emit ValueSet(_value);
    }

    event ValueSet(uint256 value);

}
