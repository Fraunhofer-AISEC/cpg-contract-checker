pragma solidity 0.5.1;

contract Interface {
    function something() public;
    function somethingElse() public;
}


contract Undeployable is Interface {
    uint x;
    function something() public {
        
        x=1;
    }
}

contract Deployable is Undeployable {
    uint y;
    function somethingElse() public {
        
        y=1;
    }
}
