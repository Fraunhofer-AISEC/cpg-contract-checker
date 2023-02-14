contract DivZero {
  function divide(uint numerator, uint denominator) public constant returns(uint) {
    return numerator / denominator;   
  }
}
