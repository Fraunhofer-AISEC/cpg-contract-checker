pragma solidity >=0.7.0 <0.9.0;

contract Storage {

    string[] messages;

    uint256 bidPrice;

    constructor() payable  {
        bidPrice = msg.value * 10001 / 10000;
    }

    function store(string calldata message) public payable {
        if (msg.value < bidPrice) revert( "Payment not enough" );
        messages.push(message);
        bidPrice = bidPrice * 10001 / 10000;
    }

    function retrieve(uint index) public view returns (string calldata){
        return messages[index];
    }
}