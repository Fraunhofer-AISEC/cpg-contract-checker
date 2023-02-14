mapping (address => uint256) public balanceOf;

function importFrom(address _from) onlyOwner {
    Token s = Token(_from);
    balanceOf = s.balanceOf;
}
