contract Crowdsale {

        address owner;  
        mapping(address => uint256) balances;
        function Crowdsale(){
            owner = msg.sender;
        }

        function acceptOnlyMyToken(address _yourTokenAddress, uint256 amount){
            address user = msg.sender;
            YourToken token = YourToken(_yourTokenAddress);

            
            uint256 userBalance = token.balanceOf(user);
            
            if(userBalance >= amount){      
                token.transferFrom(user, owner, amount);        

            }

        }

    }
