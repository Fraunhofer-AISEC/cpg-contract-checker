pragma solidity ^0.5.0;
contract Reg {
    mapping (address => uint256) public userBalances;
    address payable otherContr;

    constructor(address payable otherContrAddr) public {
        otherContr = otherContrAddr;
    }

    function() payable external  {
        userBalances[msg.sender] += msg.value;
    }

    function transferToOtherContr() public {
        otherContr.transfer(address(this).balance);
    }

}

contract Subm {
    function() payable external { 
        
    }
}
