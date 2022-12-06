contract MyToken {

    mapping (address => uint256) public balanceOf;
    function MyToken(uint256 initialSupply) {
        balanceOf[msg.sender] = initialSupply;
    }
}
