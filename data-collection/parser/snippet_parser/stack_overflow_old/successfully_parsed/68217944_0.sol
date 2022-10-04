
pragma solidity ^0.8.0;

contract Reverse {
    function reverse_recurse(uint i, uint r) internal returns(uint) {
      if (i != 0) {
        uint least_digit = i % 10;
        if (r >= type(uint).max / 10 && (r > type(uint).max / 10 || least_digit > type(uint).max % 10)) {
          return 0; 
        }
        r = reverse_recurse(i / 10, r * 10 + least_digit);
      }
      return r;
    }
    
    
    function reverse_int(uint i) public returns(uint) {
      return reverse_recurse(i, 0);
    }
}
