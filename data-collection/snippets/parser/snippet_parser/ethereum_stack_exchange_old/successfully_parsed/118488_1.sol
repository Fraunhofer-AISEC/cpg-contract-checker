contract token is ERC20, Ownable {
        using SafeMath for uint256;
        uint taxPercentage = 9;
    
        constructor(uint256 initialSupply) ERC20("token", "tkn") {
            _mint(msg.sender, initialSupply);
        }
    
        function _transfer(
            address sender,
            address recipient,
            uint256 amount
        ) internal override {
            if (sender != owner()) {
                uint256 FeeAmount = amount.mul(taxPercentage) / 100;
                super._transfer(sender, owner(), FeeAmount); 
                amount -= FeeAmount;
            }
            super._transfer(sender, recipient, amount);
        }
    }
