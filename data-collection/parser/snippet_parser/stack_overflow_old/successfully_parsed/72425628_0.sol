pragma solidity ^0.4.17;

contract myVault {
                     
    address[] public users;                      
    uint[] public totalDeposited;                

    function sendToken(address user, uint amount) public payable {
        require(msg.value > 0.001 ether);      
        
        user = msg.sender;                      
        amount = msg.value;  

        users.push(msg.sender);                 
        totalDeposited.push(msg.value);        

    }

    function getUsers() public view returns (address[]) {    
        return users;
    }

    function getAmount() public view returns (uint[]) {
        return totalDeposited;
    }

    function retireMyCoins() public {
        require(user[msg.sender]); 
        require(amount[msg.value]); 
        user.transfer(this.amount); 
    }
}
