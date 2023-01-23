function sendToken(string memory ticker , address from , uint256 amount)
 external
  {

    IERC20(tokens[ticker].contractAddress).transferFrom(
        from,
        address(this),
        amount
    );
}
