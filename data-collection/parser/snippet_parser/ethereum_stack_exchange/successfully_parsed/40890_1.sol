uint value = 50;

function checkValue(uint amount) returns (bool) {
    return amount <= value;
}

function withdraw(uint amount) {
    if(checkValue(amount)) {
        value -= amount;
    }
}
