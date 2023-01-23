pragma solidity >0.4.23 <0.5.0;

contract C {
    uint[] data;

    function f() public pure returns (uint, bool, uint) {
        return (7, true, 2);
    }

    function g() public {
        
        (uint x, bool b, uint y) = f();
        
        (x, y) = (y, x);
        
        (data.length,,) = f(); 
    }
}
