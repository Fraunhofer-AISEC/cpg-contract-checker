
pragma solidity ^0.8.0;

contract CoinStore {
    address owner;
    mapping(address => uint256) buyers;
    mapping(address => uint256) sellers;
    uint256 coinPrice;
    bool tradePaused;

    constructor() {
        owner = msg.sender;
    }

    function setCoinPrice(uint256 _price) public {
        require(msg.sender == owner, "Only the owner can set the coin price.");
        coinPrice = _price;
    }

    function registerBuyer(address _buyer, uint256 _amount) public {
        require(!tradePaused, "Trading is currently paused.");
        buyers[_buyer] = _amount;
    }

    function registerSeller(address _seller, uint256 _amount) public {
        require(!tradePaused, "Trading is currently paused.");
        sellers[_seller] = _amount;
    }

    function pauseTrade() public {
        require(msg.sender == owner, "Only the owner can pause trading.");
        tradePaused = true;
    }

    function startTrade() public {
        require(msg.sender == owner, "Only the owner can start trading.");
        tradePaused = false;
    }

    function completeSale(address _buyer, address _seller) public payable {
        require(_buyer.balance >= buyers[_buyer], "Buyer does not have enough funds.");
        require(_seller.balance >= sellers[_seller], "Seller does not have enough funds.");
        require(msg.value == coinPrice, "Incorrect payment amount.");

        _buyer.transfer(buyers[_buyer]);
        _seller.transfer(sellers[_seller]);

        if (msg.value > buyers[_buyer]) {
            _buyer.transfer(msg.value - buyers[_buyer]);
        }
    }

    function withdrawFunds() public {
        require(msg.sender == owner, "Only the owner can withdraw funds.");
        msg.sender.transfer(address(this).balance);
    }
}
