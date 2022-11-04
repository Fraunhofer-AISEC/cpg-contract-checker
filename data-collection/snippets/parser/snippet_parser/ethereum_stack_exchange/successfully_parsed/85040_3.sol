
pragma solidity ^0.6.0;

contract Matrix {

    uint public rowLimit;
    uint public colLimit;
    
    mapping(uint => mapping(uint => uint)) public matrix;
    
    modifier finiteArray(uint x, uint y) {
        require(x <= rowLimit, "Row out of bounds");
        require(y <= colLimit, "Col out of bounds");
        if(x == rowLimit) rowLimit++; 
        if(y == colLimit) colLimit++; 
        _;
    }

    function set(uint row, uint col, uint val) public finiteArray(row,col) {
        matrix[row][col] = val;
    }
}
