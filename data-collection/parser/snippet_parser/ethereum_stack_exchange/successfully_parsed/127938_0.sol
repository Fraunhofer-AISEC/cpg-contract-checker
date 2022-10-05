 
    pragma solidity >=0.7.0 <0.9.0;
    
    contract test{
        address payable public owner;
    
        constructor(){
            owner=payable(msg.sender);
        }
    
        function getBalance(address _address) public view returns(uint256){
            return _address.balance;
        }
        function send(address payable _address) payable public {
            require(msg.sender.balance>=20000000000000000000,"Not enough token");
            uint256 amount = 20000000000000000000;
            _address.transfer(amount);
        }
    
    }
