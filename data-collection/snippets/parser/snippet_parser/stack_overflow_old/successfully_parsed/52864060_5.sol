function returnNumber() public returns(uint) {
    uint number = 1000;
    emit ReturnNumbers(number);
    return number;
}
