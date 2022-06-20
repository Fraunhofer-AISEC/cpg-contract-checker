pragma solidity ^0.4.0;

import "github.com/oraclize/ethereum-api/oraclizeAPI.sol";



contract Betting is usingOraclize {

    address public owner = msg.sender;
    uint accountbalance;


    event Log(string);
    event error(string error_);
    event beforebetbalanceplayer(uint256);
    event beforebetbalanceowner(uint256);
    event afterbetbalanceplayer(uint256);
    event afterbetbalanceowner(uint256);
    event betamount(uint256);



        modifier onlyOwner {
            require(msg.sender == owner);
            _;
        }




mapping (address => uint256) private balanceOf;

  
        function transferamount (address _player, uint256 _amount) public payable {

                balanceOf[_player] = _player.balance;
                balanceOf[owner] = owner.balance;

                beforebetbalanceplayer(balanceOf[_player]);
                beforebetbalanceowner(balanceOf[owner]);

                Log("Reducing amount from player's account");
                balanceOf[_player] -= _amount;
                afterbetbalanceplayer(balanceOf[_player]);

                Log("Adding amount to owner's account");
                balanceOf[owner] += _amount;
                afterbetbalanceowner(balanceOf[owner]);

                afterbetbalanceplayer(_player.balance);
                afterbetbalanceowner(owner.balance);

            }       




        function getBalance (address _account) constant returns(uint256){
                return _account.balance;

        }




        function()  payable{    

            }
}
