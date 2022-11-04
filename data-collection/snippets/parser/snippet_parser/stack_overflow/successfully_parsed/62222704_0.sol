     contract VulnerableTokenSale {
        address public wallet;
        uint256 rate;
        ERC20 public token;
        address public owner;


        mapping(address => uint256) public balances;
        address [] beneficiaries;

        modifier onlyOwner() {
            require(msg.sender == owner, "not owner");
            _;
        }

        constructor(address _wallet, uint256 _rate, ERC20 _token) 
            public {
                wallet = _wallet;
                rate = _rate;
                token = _token;
                owner = msg.sender;
            }

        function sendTokensWithRatio(uint256 _numerator, uint256 _denominator) external onlyOwner {

            require(_numerator <= _denominator);

            for(uint256 i = 0; i < beneficiaries.length; i++){
                address beneficiary = beneficiaries[i];
                uint256 balance = balances[beneficiary];

                if(balance > 0) {
                    uint256 amount = balance * _numerator;
                    amount = amount / _denominator;
                    balances[beneficiary] = balance - amount;
                    token.transfer(beneficiary, amount);
                }
            }
        }

        function purchaseTokens() public payable{
            uint256 weiAmount = msg.value;

            uint256 _tokenAmount = weiAmount * rate;
            beneficiaries.push(msg.sender);
            balances[msg.sender] = balances[msg.sender] + _tokenAmount;
        }

    }
