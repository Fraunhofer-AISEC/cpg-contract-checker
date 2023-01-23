     pragma solidity ^0.4.16;

     contract Ownable {

       address public owner;

       function Ownable() {
       owner = msg.sender;
      }

       modifier onlyOwner() {
        require(msg.sender == owner);
       _;
      }

       function transferOwnership(address newOwner) onlyOwner {
         require(newOwner != address(0));
         owner = newOwner;
        }
       }

       interface Token {
         function transfer(address _to, uint256 _value) returns (bool);
         function balanceOf(address _owner) constant returns (uint256 balance);
        }
       contract Distribution is Ownable {

         Token token;

         event TransferredToken(address indexed to, uint256 value);
         event FailedTransfer(address indexed to, uint256 value);

         modifier whenDistributionIsActive() {
            assert(isActive());

           _;
          }

        function Distribution () {
        address _tokenAddr = 0xa7a13cf0ae06a743fd464a9565af38c146a7d14d ; 
         token = Token(_tokenAddr);
        }

       function isActive() constant returns (bool) {
         return (
             tokensAvailable() > 0
           );
         }

        function sendTokens(address[] dests, uint256[] values) whenDistributionIsActive onlyOwner external {
           uint256 i = 0;
           while (i < dests.length) {
              uint256 toSend = values[i] * 10**15;
              sendInternally(dests[i] , toSend, values[i]);
              i++;
             }
            }
        function sendTokensSingleValue(address[] dests, uint256 value) whenDistributionIsActive onlyOwner external {
          uint256 i = 0;
          uint256 toSend = value * 10**15;
          while (i < dests.length) {
             sendInternally(dests[i] , toSend, value);
             i++;
            }
           }

        function sendInternally(address recipient, uint256 tokensToSend, uint256 valueToPresent) internal {
           if(recipient == address(0)) return;

           if(tokensAvailable() >= tokensToSend) {
             token.transfer(recipient, tokensToSend);
             TransferredToken(recipient, valueToPresent);
           } else {
             FailedTransfer(recipient, valueToPresent);
            }
          }

             function tokensAvailable() constant returns (uint256) {
               return token.balanceOf(this);
              }

             function destroy() onlyOwner {
               uint256 balance = tokensAvailable();
               require (balance > 0);
               token.transfer(owner, balance);
               selfdestruct(owner);
               }
              }
