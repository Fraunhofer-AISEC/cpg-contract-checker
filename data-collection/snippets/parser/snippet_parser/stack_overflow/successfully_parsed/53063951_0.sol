         pragma solidity ^0.4.23; 

         contract EnergyContract {


           struct EnContract {
             uint price;
             uint amount;
             string[] energysource;
             address creator;   
           }

           EnContract[] aContract;

           function createContract(uint _price, uint _amount, address _creator) public {
             aContract.length += 1;
             EnContract storage _EnContract = aContract[aContract.length - 1];

             _EnContract.price = _price;
             _EnContract.amount = _amount;
             _EnContract.creator = _creator;    
           }


         }
