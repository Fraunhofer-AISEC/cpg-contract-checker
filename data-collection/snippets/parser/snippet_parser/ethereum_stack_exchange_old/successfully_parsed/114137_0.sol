

pragma solidity ^0.8.9;
contract Selectors {
    
    bool public called;
    function callOtherFunc() public {
        bytes4 func = this.otherFunc.selector;
        (bool success, ) = address(this).call(abi.encodeWithSelector(func, true));
    }
    
    function otherFunc(bool _called) internal {
        called =_called; 
    }
}
