 pragma solidity ^0.4.18;

        interface tokenRecipient { function receiveApproval(address _from, uint256 _value, address _token, bytes _extraData) public; }

        contract TokenERC20 {
            
            string public name;
            string public symbol;
            uint8 public decimals = 18;
            
            uint256 public totalSupply;

            
            mapping (address => uint256) public balanceOf;
            mapping (address => mapping (address => uint256)) public allowance;

            
            event Transfer(address indexed from, address indexed to, uint256 value);

            
            event Burn(address indexed from, uint256 value);

            
            function TokenERC20(uint256 initialSupply , string tokenName , string tokenSymbol) public {

                totalSupply  = 250000000  ** uint256(18); 
                balanceOf[msg.sender]  = totalSupply;                
                name  = "PONTEM";                                   
                symbol  = "PXM";                               
            }

            

function _transfer (address _from, address _to, uint _value) internal {
                
                require(_to != 0x0);
                
                require(balanceOf[_from] >= _value);
                
                require(balanceOf[_to] + _value > balanceOf[_to]);
                
                uint previousBalances = balanceOf[_from] + balanceOf[_to];
                
                require(!frozenAccount[_from]);                     
                require(!frozenAccount[_to]);                       
                balanceOf[_from] -= _value;
                
                balanceOf[_to] += _value;
                Transfer(_from, _to, _value);
                
                assert(balanceOf[_from] + balanceOf[_to] == previousBalances);
            }
            }
