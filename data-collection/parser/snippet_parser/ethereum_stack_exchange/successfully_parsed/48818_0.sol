pragma solidity ^0.4.25;
contract MyContract {
    uint256[] public data;
    function write(uint256 entry) public {
        data.push(entry);
    }    
    function read() public constant returns(uint256[]) {
        return(data);
    }
}