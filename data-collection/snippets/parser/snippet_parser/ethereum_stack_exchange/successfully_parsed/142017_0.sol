function buy(uint _amount) public {
    ITokens(tokensContract).burnAndRedeemFrom(
        _msgSender(),
        _amount
    );

    emit MachineBuy(_amount, _msgSender());
}
