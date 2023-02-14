import "dapple/test.sol";


contract MyTest is Test {

  struct Struct {
    uint timestamp;
  }

  
  mapping(uint => mapping(uint => uint)) mymap;

  mapping(address => mapping(uint => Struct[])) someName;

  function testNestedMappings() {
    
    mymap[1][2] = 42;
    
    
    
    
    someName[msg.sender][1].length++;
    
    someName[msg.sender][1][someName[msg.sender][1].length - 1].timestamp = block.timestamp;
    
  }
}
