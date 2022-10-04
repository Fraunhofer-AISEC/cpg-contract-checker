
pragma solidity >=0.7.0 <0.9.0;

contract holder {
    
    mapping(bool => address[]) holders;
    
    function buyToken() public {
        holders[true].push(msg.sender);
    }
    
    function getHolders() public view returns(address[] memory) {
        return holders[true];
    }
}
