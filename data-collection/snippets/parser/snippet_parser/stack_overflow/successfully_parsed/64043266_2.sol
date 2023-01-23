pragma solidity >=0.4.22 <0.7.0;

contract Bla {

    mapping(string => uint256) colors;
    
    function voteColor(string memory color) public { 
        colors[color]++;
    }
    
    function getColorCount(string memory color) public view returns (uint256) {
        return colors[color];
    }
}
