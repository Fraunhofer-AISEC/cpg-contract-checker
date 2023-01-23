pragma solidity ^0.4.11;
contract ArrayOfBytes32 {
    address creator;
    bytes32[10] bytesArray; 
  
    function ArrayRR() 
    {
        creator = msg.sender;
        uint8 x = 0;
        while(x < bytesArray.length)
        {
            bytesArray[x] = "myString"; 
            x++;
        }
    }
   
    function getArray() constant returns (bytes32[10])
    {
        return bytesArray;
    }
    
    function getValue(uint8 x) constant returns (bytes32)
    {
        return bytesArray[x];
    }
}
