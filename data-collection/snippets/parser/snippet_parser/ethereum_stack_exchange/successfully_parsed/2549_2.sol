import "dapple/test.sol";

contract A is Test {
  uint[][] multiarray;

  function testMultiArray() {
    
    
    multiarray.length++;
    
    
    
    multiarray[0].length++;
    multiarray[0].length++;
    
    
    multiarray[0][0] = 1;
    multiarray[0][1] = 1;
    
    
    
    
    multiarray.length--;
    
    
    multiarray.length++;
    
    multiarray[0].length++;
    multiarray[0].length++;
    
    
  }
}
