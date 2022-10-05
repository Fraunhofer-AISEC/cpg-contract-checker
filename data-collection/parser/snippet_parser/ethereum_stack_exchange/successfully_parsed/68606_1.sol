pragma solidity ^0.5.5;
contract Test {
   uint [] public players ;
    constructor() public {
        players.push(1);
        players.push(2);
        players.push(3);
    }

    function getArray() public view returns (uint[] memory){
       return players;
    }
}
