pragma solidity ^0.8.2;

 import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
 import "@openzeppelin/contracts/token/ERC20/extensions/draft-ERC20Permit.sol";
 import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol";

 contract Mytokencontract is ERC20, ERC20Permit, ERC20Votes {
  constructor()
    ERC20("Mytokens", "MTK")
    ERC20Permit("Mytokens")
    {}

    constructor() public payable {
     validator1 = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
     validator2 = 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db;
     user1 = 0x0A098Eda01Ce92ff4A4CCb7A4fFFb5A43EBC70DC;
     user2 = 0x583031D1113aD414F02576BD6afaBfb302140225;
     user3= 0x1aE0EA34a72D944a8C7603FfB3eC30a6669E454C;
      }
     function Sign() public {
      require (msg.sender == validator1 || msg.sender == validator2);
      require (signed[msg.sender] == false);
      signed[msg.sender] = true;
        }

       function _afterTokenTransfer(address from, address to, uint256 amount)
         internal
         override(ERC20, ERC20Votes)
       {
          super._afterTokenTransfer(from, to, amount);
        }

      function _mint(address to, uint256 amount)
         internal
          override(ERC20, ERC20Votes)
          {
          super._mint(to, amount);
            }

           function _burn(address account, uint256 amount)
            internal
          override(ERC20, ERC20Votes)
            {
           super._burn(account, amount);
            }

            function issueToken(address _to, uint256 _numberOfToken) private {
              require (signed[validator1] == true && signed[validator2] == true);
              ERC20.transfer(_to, _numberOfToken);
               }
                }
