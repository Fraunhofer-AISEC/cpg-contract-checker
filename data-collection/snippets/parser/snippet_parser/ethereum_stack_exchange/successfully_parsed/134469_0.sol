
pragma solidity ^0.8.16;
contract todo
{
   struct llist
   {  
       uint no ;         
       string cont ;        
       address own ;         
       bool iscom ;            
       uint ttim ;              
   }
    uint public i ; 
    mapping ( address => uint) public num ;        
    mapping ( address => llist[100]) public num2 ;   
    function real( string memory _contect) public
    {
        if (  num[msg.sender] > 99)

        i = 8 ;

        else
        {num2[msg.sender].push( num[msg.sender] , _contect,payable(msg.sender),false,block.timestamp);    
                  num[msg.sender]++ ;
        }
     }
}
