pragma solidity ^0.8.10;



contract DutchAuction {

    event Buy(address winner, uint amount);

    address payable public seller;
    uint public startingPrice;
    uint public startAt;
    uint public expiresAt;
    uint public priceDeductionRate;
    address public winner;


    constructor(
        uint _startingPrice,
        uint _priceDeductionRate

    ) {
        
        seller = payable(msg.sender);
        startingPrice = _startingPrice;
        startAt = block.timestamp;
        expiresAt = block.timestamp + 7 days;
        priceDeductionRate = _priceDeductionRate;
    }

    function buy() external payable {
        require(block.timestamp < expiresAt, "Auction expired");
        require(winner == address(0), "Auction finished");

        uint timeElapsed = block.timestamp - startAt;
        uint deduction = priceDeductionRate * timeElapsed;
        uint price = startingPrice - deduction;

        require(msg.value >= price, "ETH < Price");

    winner = msg.sender;

    seller.transfer(msg.value);

    emit Buy(msg.sender, msg.value);
}

}```

Any ideas?
