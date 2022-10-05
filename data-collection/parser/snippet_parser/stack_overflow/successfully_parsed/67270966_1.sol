function withdrawDividends() public {
    User storage user = users[_msgSender()];

    uint256 totalAmount = getUserDividends(_msgSender());

    require(totalAmount > 0, "User has no dividends");

    user.checkpoint = block.timestamp;

    (bool success, ) = _msgSender().call.value(totalAmount)("");
    require(success, "Transfer failed.");

    emit Withdrawn(_msgSender(), totalAmount);

}
