constructor(uint _price, uint _days) public {
    owner = msg.sender;       
    price = _price;
    deadlineInDays = now + _days;
}
