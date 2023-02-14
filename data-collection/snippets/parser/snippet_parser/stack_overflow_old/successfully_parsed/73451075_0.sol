
pragma solidity >=0.7.0 <0.9.0;

contract Test {
  
  bytes32 public test = "abcdefghabcdefghabcdefghabcdefgh";
 
  function accessByteByIndex(uint index) public view returns(bytes1) {
    
    require(index<32,"Index out of range");
    return test[index];
  }
 
  function reverseBytes() public pure returns(bytes memory) {
    uint num = 32;
    bytes memory chars = new bytes(num);
    bytes memory reverse = new bytes(num);
 
    chars = "abcdefghabcdefghabcdefghabcdefgh";
 
    uint i = 0;
 
    for (i = 0; i < num; i++) {
      reverse[i] = chars[num - 1 - i];
    }
 
    return reverse;
  }
 
}
