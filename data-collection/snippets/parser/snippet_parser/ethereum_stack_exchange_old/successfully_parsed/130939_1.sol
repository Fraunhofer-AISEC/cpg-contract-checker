 pragma solidity ^0.8.7;

contract Base {
    function _someInternalFunction() internal {

    }
}

contract A is Base{
    
}

contract B is A {
    function get__someInternalFunction() public {
        _someInternalFunction();
    }
}
