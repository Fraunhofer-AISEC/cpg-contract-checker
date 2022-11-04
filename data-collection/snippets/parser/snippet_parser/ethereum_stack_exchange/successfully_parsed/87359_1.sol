contract USDPrice {
    address admin;
    uint price;

    constructor() public {
        admin = msg.sender;    
    }

    function setPrice(uint newPrice) external {
        require(admin == msg.sender, "only admin is allowed to set price");
        price = newPrice;
    }
}
