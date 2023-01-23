pragma solidity ^0.4.18;

import './MyContract.sol';

contract Foo {
    uint256 public x;
    MyContract myContract;
    address myContractAddress;

    constructor(address _myContractAddress) public {
        myContractAddress = _myContractAddress;
    }

    function baz() public {
        myContract = MyContract(myContractAddress);
        x = myContract.baz();
    }
}
