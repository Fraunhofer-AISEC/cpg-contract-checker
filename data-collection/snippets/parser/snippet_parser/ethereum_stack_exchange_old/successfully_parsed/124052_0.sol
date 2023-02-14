
pragma solidity ^0.8.5;

contract Example {

  function changeByte8() public view returns (bytes8) {
    bytes8 value = 0x3FcB875f56beddC4;

    
    bytes memory array = abi.encodePacked(value);

    
    array[4] = 0x00;
    array[5] = 0x00;

    
    array[0] = 0xFF;
    array[1] = 0xFF;
    array[2] = 0xFF;
    array[3] = 0xFF; 

    
    return bytes8(array); 
  }
}
