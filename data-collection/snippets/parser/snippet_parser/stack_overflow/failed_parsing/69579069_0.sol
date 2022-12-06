uint256 public price; 
uint256 payment;

constructor(
    uint256 _price,
) public payable {
    require(
        _price > 0,
        "The price has to be greater than 0."
    );
    
    price = _price;
}
                                        

function pay() public payable {
    require(
        msg.value == price,
        "Incorrect price."
    );

    payment = msg.value;
}
