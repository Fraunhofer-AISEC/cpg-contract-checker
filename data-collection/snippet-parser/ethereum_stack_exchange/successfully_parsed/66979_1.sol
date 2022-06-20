mapping(address => bool) public tokenHolders;

function setTokenHolders(address _to) internal {
    require(tokenHolders[_to] == false);
    tokenHolders[_to] = true;
}
