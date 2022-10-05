
pragma solidity ^0.8.7;
contract stringtobytes{
    function set(string memory  _a)public pure returns(bytes memory){
        return (bytes(_a));
    } 
}
