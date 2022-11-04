
pragma solidity ^0.8.0;

contract Ballot{
    

    
    address private chairperson;

   

   
    modifier isOwner(){
    require(msg.sender == chairperson);
    _;
}

    
    modifier isVoter(address voterAddress_){
    require(voterAddress_ == msg.sender,"The voter must register by itself...");
    _;
}
  
  modifier voterRules(){
    require(msg.sender != chairperson,"Chairperson cannot vote!!");
    for(uint m=0;m<voterList.length;m++){
    
    if( msg.sender != voterList[m]._voterAddress){
      revert();
    }
    }
    for(uint k=0;k<candidateList.length;k++){ 
    require(voterToCandidate[msg.sender] != candidateList[k]._address,"You cannot vote twice...");
    }
    
      _;
  }
  

  
  constructor(){
  chairperson = msg.sender;
    }

  

   
  
    struct Candidate{
    
    address _address;
    uint256 _noOfVotes;
    }

    
    struct Voter{
        address _voterAddress;
        bool _isVoted;
    }
    
    

   

    Candidate[] public candidateList;
    

     
    Voter[] public voterList;
    
    

    
    mapping(address=>address) private voterToCandidate;
    
    

   
   function addCandidate(address address_) public isOwner{
    for(uint i=0;i<candidateList.length;i++){
        require(address_ != candidateList[i]._address, "Same Candidate cannot be added twice");
           }

    Candidate memory candidate = Candidate(address_,0);
    candidateList.push(candidate);
    
   }

   
   function registerVoter(address voterAddress_) external isVoter(voterAddress_){
    
       for(uint j=0;j<voterList.length;j++){
       require(voterAddress_ != voterList[j]._voterAddress,"y");
       }
        voterList.push(Voter(voterAddress_,false));
      
       }

   
   function vote(uint256 _candId) public voterRules() {
         voterToCandidate[msg.sender] = candidateList[_candId]._address;
         candidateList[_candId]._noOfVotes++;
   }


}
