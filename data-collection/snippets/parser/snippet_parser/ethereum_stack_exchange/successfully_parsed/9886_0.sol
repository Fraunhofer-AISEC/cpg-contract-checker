contract A { 
    address owner;  

    function A() { 
        owner = msg.sender; 
    }

    function useB() returns (bool){ 
        B b = new B(msg.sender);
        if (!b.call.value(msg.value)(bytes4(sha3("deposit()")))) { throw; } 
        return true;

}
}

contract B { 
    address owner;
    address controllingContract;
    uint balance;

    modifier onlyOwner {
        if (msg.sender != owner) { throw; } 
        _;
    }
    modifier controlledContract {
        if (msg.sender != controllingContract) { throw; }
        _;
    }

    function B(address _owner) {
        controllingContract = msg.sender; 
        owner = _owner; 
    }
    function deposit() controlledContract{
        balance += msg.value; 
    }
    function updateContract(address _updatedContract) onlyOwner { 
        controllingContract = _updatedContract; 
    }
}
