pragma solidity ^0.4.16;

    contract MyToken {
        
        mapping (address => uint256) public balanceOf;
        function MyToken(uint256 initialSupply) public {
            balanceOf[msg.sender] = 25;
        }
}