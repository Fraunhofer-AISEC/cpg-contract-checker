
pragma solidity ^0.8.13;

contract Factory {
    
    function deploy(
        address _owner,
        uint _foo,
        uint _salt
    ) public payable returns (address) {
        return address(new TestContract{salt: bytes32(_salt)}(_owner, _foo));
    }
}

contract TestContract {
    address public owner;
    uint public foo;

    constructor(address _owner, uint _foo) payable {
        owner = _owner;
        foo = _foo;
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}
