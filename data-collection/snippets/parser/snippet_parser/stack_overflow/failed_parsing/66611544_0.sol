pragma solidity ^0.6.0;

contract MyContract {

mapping(uint => string) public names;

constuctor() public {
    names[1] = "Adam";
    names[2] = "Bruce";
    names[3] = "Carl";
}
