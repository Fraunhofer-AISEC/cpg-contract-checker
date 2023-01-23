contract Distribute {

    AggregatorV3Interface internal priceFeed;
    address public user_deployer;
    address public user_secondary;
    uint public full_val;
    uint public tok_val;
    uint public datetime;



    constructor(address user2, uint full_value, uint token_value, uint datetime_input) 
payable {
        require(msg.value == full_value / 2 ether);
        priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        user_deployer = msg.sender;
        user_secondary = user2;
        full_val = full_value;
        tok_val = token_value;
        datetime = datetime_input;
}

    function user_secondary_pay() public payable {
        require(msg.value == full_val / 2 ether);
}
}
