pragma solidity 0.5.11;

contract Elapsed {

    function stopwatch() public view returns(uint duration) {
      uint start = now;
      for (uint i=0; i<9999; i++) {
        
      }
      uint end = now;
      duration = end - start;
    }
}
