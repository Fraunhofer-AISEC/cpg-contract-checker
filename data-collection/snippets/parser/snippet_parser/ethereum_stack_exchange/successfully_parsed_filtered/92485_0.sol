pragma solidity ^0.5.0;


import "github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Capped.sol";
import "github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Detailed.sol";
import "github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/ownership/Ownable.sol";


contract OceanToken is Ownable, ERC20Detailed, ERC20Capped {

    using SafeMath for uint256;

    uint256 CAP = 1410000000;
    uint256 TOTALSUPPLY = CAP.mul(10 ** 18);

    constructor()
        public
        ERC20Detailed('OceanToken', 'OCEAN', 18)
        ERC20Capped(TOTALSUPPLY)
        Ownable()
    {
        _mint(msg.sender, TOTALSUPPLY);
    }

}

contract Try {
  
  mapping ( address => uint256 ) public balances;
  
     IERC20 public token;

    constructor(address _token) public {
        token = OceanToken(_token);
    }

  function deposit(uint tokens ) public payable{

    
    balances[msg.sender]+= tokens;

    
    token.transferFrom(msg.sender, address(this), tokens);
  }

  function returnTokens() public {
    balances[msg.sender] = 0;
    token.transfer(msg.sender, balances[msg.sender]);
  }

}
