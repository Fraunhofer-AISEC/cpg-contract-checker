pragma solidity ^0.4.6;

contract Divide {

  function percent(uint numerator, uint denominator, uint precision) public 

  constant returns(uint quotient) {

         
        uint _numerator  = numerator * 10 ** (precision+1);
        
        uint _quotient =  ((_numerator / denominator) + 5) / 10;
        return ( _quotient);
  }

}
