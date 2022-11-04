pragma solidity ^0.8.0;

abstract contract Test {
    
    event functionCompleted(address indexed);
    
    modifier emitter(address x) {
      _;
      emit functionCompleted(x);
    }
    
    function testFunction(address x) public virtual emitter(x);
}
