pragma solidity ^0.4.24; 

 contract game
 {

     struct users
     {
         string name;
         uint level;
         uint score;
     }

     mapping(uint => users[]) mulusers;

     function addusers (string _name, uint _level, uint _score) public {

         users memory use= users(_name,_level,_score); 
     }

     function getusers (uint _level) public view returns (string)
     {
        uint index= mulusers[_level].length;
         for(uint i=0; i<index; i++)
         {       
           return mulusers[_level].users[i].name;    
         }   
     }   
 }
