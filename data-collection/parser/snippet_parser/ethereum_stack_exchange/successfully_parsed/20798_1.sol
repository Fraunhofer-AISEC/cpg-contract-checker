    contract MyToken {
        function mint(address _to, uint256 _amount) returns (bool);
    }
    contract NewContract {

        Mytoken token;

        uint256 public rate;

        function NewContract(uint256 _rate,address _tokenAddress){
           token = Mytoken(_tokenAddress);
           rate = _rate;
        }
        function () payable {
            token.mint(msg.sender, msg.value);
        }
    }  
