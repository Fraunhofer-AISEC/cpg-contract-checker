pragma solidity 0.8.0;
contract MyContract{
    bytes8 [] Names;
    
    function setName(string memory _name) public{
        Names.push(_name);
    }
}
