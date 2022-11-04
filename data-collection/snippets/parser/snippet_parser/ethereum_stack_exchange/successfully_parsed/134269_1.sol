
function pay() external payable {
        uint256 numTokens = calculateTokens(msg.value);
        minter.mint(msg.sender, numTokens);  
}

receive() external payable {
     uint numTokens = calculateTokens(msg.value);
     minter.mint(msg.sender, numTokens);
 }
