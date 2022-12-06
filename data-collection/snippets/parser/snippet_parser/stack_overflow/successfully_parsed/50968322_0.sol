contract Crowdsale {
    using SafeMath for uint256;


    ERC20 public token;


    address public wallet;





uint256 public rate;


    uint256 public weiRaised;


    event TokenPurchase(
        address indexed purchaser,
        address indexed beneficiary,
        uint256 value,
        uint256 amount
);


    constructor(uint256 _rate, address _wallet, ERC20 _token) public {
        require(_rate > 0);
        require(_wallet != address(0));
        require(_token != address(0));

        rate = _rate;
        wallet = _wallet;
        token = _token;
}






function () external payable {

}


    function buyTokens(address _beneficiary, uint256 amount) public payable {

        uint256 weiAmount = amount.mul(rate);

        token.transfer(_beneficiary, weiAmount);

}
}