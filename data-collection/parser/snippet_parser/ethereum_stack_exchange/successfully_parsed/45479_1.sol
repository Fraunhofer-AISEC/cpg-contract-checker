pragma solidity ^0.4.21;

contract ShapeCalculator{
    function rectangle(uint256 w, uint256 h) public returns (uint256 s, uint256 p) {
        
        emit Width(w);
        emit Height(h);

        s = w * h;
        p = 2 * (w + h);
    }

    event Width(uint256 w);
    event Height(uint256 h);
} 
