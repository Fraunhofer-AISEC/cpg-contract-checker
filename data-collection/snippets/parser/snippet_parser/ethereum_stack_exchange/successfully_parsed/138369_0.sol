contract MyContract is ERC20{
IERC20 market;
IERC20 coin;
uint256 feesFactor = 0;
uint256 conversionRatio = 0;

    function setConversion(uint256 ratio) public {
        conversionRatio = ratio;
    }

    function getConversion() public view returns (uint256) {
        return conversionRatio;
    }

    function setFeesFactor(uint256 fees) public {
        feesFactor = fees;
    }


    function deposit(uint256 _amount) external onlyPositive(_amount) {
        

        coin.transferFrom(msg.sender, address(this), _amount);

        uint256 fees = _amount * feesFactor;

        market.mint(_amount - fees);

        uint256 tokens = (_amount - swapFees) * getConversion();
        _mint(msg.sender, tokens);

    }
}
