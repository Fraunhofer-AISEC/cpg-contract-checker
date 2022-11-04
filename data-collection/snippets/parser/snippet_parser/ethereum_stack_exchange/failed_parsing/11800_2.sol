contract TargetInterface {
    function(uint x) public;
}

contract Caller is TargetInterface {
    GenericProxy p;
    address target;

    function(uint x) public {
        
        p.forward(target, msg.data)
        
    }
}

contract Target is TargetInterface {
    function(uint x) public {...}
}
