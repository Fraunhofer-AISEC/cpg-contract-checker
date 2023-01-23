

pragma solidity >=0.7.0 <0.9.0;
contract Account {
    address public owner; 
    constructor(address _owner) {
        owner = _owner; 
    }
}
contract AccountFactory{
    function createAccount(address _owner) public {
        Account account = new Account(_owner);
    }
}
