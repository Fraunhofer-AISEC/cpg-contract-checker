contract GetPayment {

    struct Payment {
        uint amount;
        uint timestamp;
    }

    mapping(address => Payment) public mainMap;

    function pay() public payable {
    mainMap[msg.sender].amount = msg.value;
    mainMap[msg.sender].timestamp = now;
    }
}
