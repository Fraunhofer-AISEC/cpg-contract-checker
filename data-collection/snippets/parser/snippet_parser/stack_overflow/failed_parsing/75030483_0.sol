`pragma solidity ^0.6.0;

contract PaymentSplitter {
    address payable addressOne;
    address payable addressTwo;
    address payable addressThree;
    uint256 amount;

constructor(address payable _addressOne = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2, address payable _addressTwo = 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db, address payable _addressThree = 0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB) public {
    addressOne = _addressOne;
    addressTwo = _addressTwo;
    addressThree = _addressThree;
}

    function splitPayment(uint256 _amount) public {
        amount = _amount;
        addressOne.transfer(_amount / 3);
        addressTwo.transfer(_amount / 3);
        addressThree.transfer(_amount / 3);
    }

    function getSplitAmount() public view returns (uint256) {
        return amount;
    }

    
    function() external payable {
        splitPayment(msg.value);
    }
}`
