pragma solidity 0.4.25;

contract ContractInstance {
    string public _name;
    address public _head;
    address public _creator;

    constructor(string name, address head, address creator) public {
        _name = name;
        _head = head;
        _creator = creator;
    }

    function doSomething(string name) public {
        _name = name;
    }
}

contract ContractFactory {
    event ContractCreated(string name, address indexed institution, address parent);

    function createContract(string name, address head, address creator) public returns (address) {
        ContractInstance contractInstance = new ContractInstance(name, head, creator);
        emit ContractCreated(name, address(contractInstance), creator);
        return address(contractInstance);
    }
}
