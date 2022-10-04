function () payable {
    require(balanceOf[this] > 0);
    uint256 tokens = 5000 * msg.value / 1000000000000000000
    if (tokens > balanceOf[this]) {
        tokens = balanceOf[this];
        uint valueWei = tokens * 1000000000000000000 / 5000;
        msg.sender.transfer(msg.value - valueWei);
    }
    require(tokens > 0);
    balanceOf[msg.sender] += tokens;
    balanceOf[this] -= tokens;
    Transfer(this, msg.sender, tokens);
}
