
pragma solidity >=0.4.22 <0.9.0;

contract HelioToken {
        
        
        

        uint256 public totalSupply;
        mapping(address => uint256) public balanceOf;

        constructor(uint256 _initialSupply) {
                balanceOf[msg.sender] = _initialSupply;
                totalSupply = _initialSupply;
        }
        
}
