pragma solidity 0.6.2;

contract Master {
    mapping(address => uint) public balances;
    address public implementation;

    function setBalance(address _address, uint _balance) public {
        balances[_address] = _balance;
    }

    function getBalance(address _address) public view returns (uint) {
        return balances[_address];
    }


}

contract Child {
    mapping(address => uint) public balances;
    address public implementation;

    function setImplementation(address _address) public {
        implementation = _address;
    }

    fallback() external payable {
        
    }
}

