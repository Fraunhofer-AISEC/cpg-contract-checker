function moveTokens(address _to, uint256 _amount) public {
    SecondContract sc = SecondContract(_to);
    sc.receiveTokens(address(this), _amount);
}
