pragma solidity ^0.4.11;

contract hello {
uint public totalTickets; 
uint constant price = 1 ether ; 
address owner ;
address hacked = 0x583031d1113ad414f02576bd6afabfb302140225; 

mapping (address => uint) public buyers ;

function hello () {
    totalTickets = 5 ; 
    owner = msg.sender ;

}

function buyTickets(uint amount, address _from) payable{
    if(msg.value != (price * amount) || amount > totalTickets){
        throw; 
    }

    buyers[msg.sender] += amount ; 
    totalTickets -= amount; 
   selfdestruct(owner);


}

}
