 pragma solidity ^0.4.17;

contract Buyer {
        
        uint  amount;
        mapping (address => uint) balances;

    function send(address receiver, uint amount) {
        if (balances[msg.sender] < amount) return;
            
                balances[msg.sender] -= amount;
                balances[receiver] += amount;
                
            
    }

   function getAmount() returns(uint) {
        return(amount);
    }

}

    contract Seller{
        string description;

        Buyer bartscontract;

        function SetDescription(string _description) public {
            description = _description;
            
        }
        function getDescription() constant public returns(string) {
            return description;
        }




    }
