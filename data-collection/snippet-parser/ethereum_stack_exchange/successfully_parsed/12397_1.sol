 pragma solidity ^0.4.6;
 contract NumTest {
    int8 i;

    function NumTest() {
      i = -1;
    }

    function number() constant returns (uint32 num) {
      uint32 val = 3;
      return uint32( uint32(i) * val + 20);
    }
}
