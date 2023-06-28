function multiply(uint a, uint b, uint decimals) public returns(uint){
    uint result = (a*b)/(10**(decimals**2));
    return result;
}
