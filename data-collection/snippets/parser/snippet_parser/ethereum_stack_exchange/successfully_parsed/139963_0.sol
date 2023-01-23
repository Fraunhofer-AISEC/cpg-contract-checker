contract Trading {
    address public seller;
    struct Product {
        address buyer;
        uint itemId;
        uint price;
        bool isLocked;
    }
    
    modifier buyerCheck() {
        require (msg.sender != seller);
        _;
    }
    
    mapping (uint => Product) buyerInfo;

    constructor() {
        seller = msg.sender;
    }

    function getSeller() public view returns(address) {
        return seller;
    }

    function getBalance() public view returns(uint) {
        return msg.sender.balance;
    }

    function buy(uint _itemId, uint _price, bool _isLocked) public payable {
        require(msg.sender != seller);
        require(msg.sender.balance >= (msg.value + msg.value / 100));
        uint fee = _price / 100;
        buyerInfo[_itemId] = Product(msg.sender, _itemId, _price, _isLocked);
        payable(seller).transfer(msg.value + fee);
    }
}
