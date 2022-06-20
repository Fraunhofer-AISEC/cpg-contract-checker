contract Divide {
    
    function getDivided(uint numerator, uint denominator) public constant returns(uint quotient, uint remainder) {
        quotient  = numerator / denominator;
        remainder = numerator - denominator * quotient;
    }
}
