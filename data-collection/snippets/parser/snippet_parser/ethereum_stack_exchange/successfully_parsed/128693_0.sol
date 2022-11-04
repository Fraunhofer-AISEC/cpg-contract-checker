
pragma solidity ^0.8.9;
contract voting{

address private onlyowner;
uint private Virat =0;
uint private Rohit =0;

constructor(){
        onlyowner = msg.sender;
}

function topic(string memory _c) public pure returns(string memory){
          string  memory C = _c;
           return C;
}

 function vote(uint vor)public{
     require(vor <2 , "invalid input");

     if (vor == 0){
         Virat++;
     }
     else if(vor ==1){
         Rohit++;
     }
 }
 function result() public view returns(string memory){
     if(Virat > Rohit){
         return "VIRAT";
     }
     else if(Rohit > Virat){
         return "ROHIT";
     }
     return "DRAW";
 }
}
