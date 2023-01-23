    function buyTokens(uint256 _numberOfTokens) public payable {
    require(msg.value == multiply(_numberOfTokens, tokenPrice));
    require(tokenContract.balanceOf(this) >= _numberOfTokens);(issue is here)
    require(tokenContract.transfer(msg.sender, _numberOfTokens));
