pragma solidity >=0.4.22 <0.6.0;

contract simpleAuction{
    uint currentValue = 0;
    address buyer;

    function set() public payable{
        uint sent = msg.value;
        require(sent>currentValue, "Bid less than current value.");

        buyer.transfer(currentValue);

        currentValue = sent;
        buyer = msg.sender;
    }

    function winner() public view returns (address addressWinner, uint newValue){
        addressWinner = buyer;
        newValue = currentValue;
    }
}
