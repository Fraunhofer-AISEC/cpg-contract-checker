pragma solidity 0.5.1;

contract ReturnTheChange {

    uint smallestUnit = 5 * 10 ** 16;

    function sendFunds() public payable {
        uint sentBase;
        uint returnChange;
        (sentBase, returnChange) = calculateAmounts(msg.value);
        
        
        
        msg.sender.transfer(returnChange);
    }

    function calculateAmounts(uint grossAmount) public view returns(uint base, uint change) {
        uint changeToReturn = grossAmount % smallestUnit;
        uint baseAmount = grossAmount - changeToReturn;
        return(baseAmount, changeToReturn);
    }
}
