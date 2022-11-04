pragma solidity ^0.5.0;

pragma experimental ABIEncoderV2;

import "./sharedLib.sol";

import "./projetSC.sol";    

contract CrowdFactory {
  using sharedLib for sharedLib.Client; 
  using sharedLib for sharedLib.Projet;


  mapping(address => ClientSC) public usersinfo;  
  mapping (address=> sharedLib.Projet)public projectsinfo; 

 
 address[] public users; 
 address[] public clients;
 address[] public Projects; 


constructor () public {}




event registred(address contractAddress, address publickey, uint userId ) ;
event projectAdded(address contractAddress, address porteur, uint pID ) ;
event loggedin(address publickey , uint userId);




function isRegistred (address _userAddress) 
  internal 
  view   
  returns(bool){
    for(uint256 i = 0; i < users.length; i++){
      if(users[i] == _userAddress) return true;
      else         return false;
    }             
  }

 
 function Registration (uint _userId,  string memory _mail ,string memory _password)   
 public
 returns (ClientSC newClient )
 {
   require (!isRegistred(msg.sender));
   ClientSC newClient = new ClientSC  ( _userId, _mail , _password);
   usersinfo[msg.sender]= newClient;
   users.push(msg.sender);
   clients.push(address (newClient));
   emit registred(address(newClient),msg.sender, _userId);
   return (newClient) ;
 } 
}