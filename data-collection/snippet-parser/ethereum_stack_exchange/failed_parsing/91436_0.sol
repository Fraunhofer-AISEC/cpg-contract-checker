import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.3.0/contracts/token/ERC20/ERC20.sol"
contract ERC20Token is ERC20 {
     ...
    function transfer(address recipient, uint256 amount) public override returns (bool) {
            require(mustBeDude(msg.sender), "msg.sender must be on chain");
            require(mustBeDude(recipient), "Recipient must be on chain");
            super.transfer(recipient, amount);
        }
    ...
   }
