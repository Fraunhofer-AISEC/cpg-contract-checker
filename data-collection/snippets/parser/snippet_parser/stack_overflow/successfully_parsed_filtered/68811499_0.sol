contract TestContract {
    struct Buyer {
        bytes32 name;
        uint price;
    }
    mapping(address => Buyer) buyerInfo;
}
