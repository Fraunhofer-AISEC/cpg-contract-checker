uint public fee=10;

function getRemainder()public view returns(uint) {
    uint count = fee*90/100;
    uint remainder = fee - count;
    return remainder;   
}
