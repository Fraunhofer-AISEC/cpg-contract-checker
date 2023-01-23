
contract Contract is ERC20 {

    event Gave(address _to, uint256 amount, uint256 ethRate, uint256 amountEth);

    constructor() ERC20("TAHerzelSeventyNine2", "TAHSN2") {
        _mint(msg.sender, toWei(1000000));
        admin = payable(msg.sender);
        ethFund = payable(address(0x...));
    }

    function give(address _to, uint256 _amountOfTokens) payable public {
        uint256 dexBalance = balanceOf(address(this));

        require(msg.sender == admin, "Only Admins allowed to give");
        require(msg.value > 0, "You need to send some ether");
        require(toWei(_amountOfTokens) <= dexBalance, "Not enough tokens in the reserve");
        transfer(_to, toWei(_amountOfTokens));
        bool sent = ethFund.send(msg.value);
        require(sent, "Failed to send Ether");
        emit Gave(_to, toWei(_amountOfTokens), uint256(getLatestPrice()), uint256(msg.value));
    }

}
