  (delegatecall)    (call)
A -------------> B ----> C

contract C {
    uint32 public num;
    address public sender;

    function setVars(uint32 _num) public {
        num = _num;
        sender = msg.sender;
    }
}

contract B {
    uint32 public num;
    address public sender;
    C public c;
    
    constructor(address _contract) {
        c = C(_contract);
    }

    function setVars(uint32 _num) public {
        c.setVars(_num); 
        num = _num;
        sender = msg.sender;
    }
}

contract A {
    uint32 public num;
    address public sender;

    function setVars(address _contract, uint32 _num) public {
        _contract.delegatecall(
            abi.encodeWithSignature("setVars(uint32)", _num)
        );
    }
}
