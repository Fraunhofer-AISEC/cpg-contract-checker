contract DividendToken {
    uint private totalDividendsPerToken = 0;
    mapping (address => uint) private dividendsPerTokenPaid;

    function distributeDividends () public payable {
        require (msg.value % totalSupply () == 0);
        totalDividendsPerToken += msg.value / totalSupply ();
    }

    function payOutDividends (address payable who) internal {
        uint amount =
            balanceOf (who) *
            (totalDividendsPerToken - dividendsPerTokenPaid [who]);
        dividendsPerTokenPaid [who] = totalDividendsPerToken;
        who.transfer (amount);
    }

    ...
}
