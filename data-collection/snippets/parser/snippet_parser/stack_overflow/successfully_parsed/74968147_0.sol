contract ServicePay{
    address payable public owner;
    address payable public buyer;
    address payable public seller;
    uint public amount;
    bool public resolved;
    uint public expiration;
    uint public fee;

    constructor(address payable _buyer, address payable _seller, uint _amount, uint _expiration) {
        owner = msg.sender; 
        buyer = _buyer;
        seller = _seller;
        amount = _amount;
        resolved = false;
        expiration = _expiration;
        fee = _amount * 2 / 100;
    }

    

    function release() public {
        require(!resolved, "The payment has already been resolved.");
        require(msg.sender == owner, "Only the owner can release the funds.");
        seller.transfer(amount - fee);
        owner.transfer(fee);
        resolved = true;
    }
}