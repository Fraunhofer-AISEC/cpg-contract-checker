uint value = 50;

modifier checkValue(uint amount) {
    require(amount <= value);
    _;
}


function withdraw(uint amount) checkValue(amount) {
    value -= amount;
}
