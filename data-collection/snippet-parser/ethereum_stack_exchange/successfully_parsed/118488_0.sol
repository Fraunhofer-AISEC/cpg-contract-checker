contract token is ERC20, Ownable {
    using SafeMath for uint256;
    uint feePercentage = 9;
    address public deployer;

    constructor(uint256 initialSupply) ERC20("token", "tkn") {
        _mint(msg.sender, initialSupply);
        deployer = msg.sender;
    }

    function _transfer(
        address sender,
        address recipient,
        uint256 amount
    ) internal override {
        if (sender != deployer) {
            uint256 FeeAmount = amount.mul(feePercentage) / 100;
            super._transfer(sender, deployer, FeeAmount);
            amount -= FeeAmount;
        }
        super._transfer(sender, recipient, amount);
    }
} 
