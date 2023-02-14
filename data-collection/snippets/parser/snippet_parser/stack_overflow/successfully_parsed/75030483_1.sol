
pragma solidity ^0.6.0;

contract PaymentSplitter {
    address payable addressOne;
    address payable addressTwo;
    address payable addressThree;
    uint256 amount;

    constructor(address _addressOne, address _addressTwo, address _addressThree) public {
        addressOne = payable(_addressOne);
        addressTwo = payable(_addressTwo);
        addressThree = payable(_addressThree);
    }

    
    function splitPayment() public {
        
        uint smartContractBalance = address(this).balance;
        
        
        amount =  smartContractBalance / 3;
        addressOne.transfer(amount);
        addressTwo.transfer(amount);
        addressThree.transfer(amount);
    }

    function getSplitAmount() public view returns (uint256) {
        return amount;
    }

    
    receive() external payable {
        splitPayment();
    }
} 
