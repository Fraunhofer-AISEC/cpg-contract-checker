contract TestToken is ERC20 {
    using SafeMath for uint256;

    string public symbol = "TEST";
    string public name = "TEST Token";
    uint8 public decimals = 18;
    uint256 public _totalSupply = 140000000 * 10**uint256(decimals);
}


contract TestCrowdsale is Crowdsale, WhitelistedCrowdsale, AllowanceCrowdsale, CappedCrowdsale, TimedCrowdsale
{
function TestCrowdsale(
    uint256 _openingTime,
    uint256 _closingTime,
    uint256 _rate,
    address _wallet,
    address _tokenWallet,
    uint256 _cap,
    TestToken _token
    )
    public
    Crowdsale(_rate, _wallet, _token)
    AllowanceCrowdsale(_tokenWallet)
    CappedCrowdsale(_cap)
    TimedCrowdsale(_openingTime, _closingTime)
    {
    }
}
