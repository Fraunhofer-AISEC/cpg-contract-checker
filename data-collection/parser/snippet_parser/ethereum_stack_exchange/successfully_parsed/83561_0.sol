pragma solidity ^0.6.6;

interface ERC165 {
    function supportsInterface(bytes4 interfaceID) 
       external view returns (bool);
}
