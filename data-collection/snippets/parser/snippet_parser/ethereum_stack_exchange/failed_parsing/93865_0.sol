 function claimCard(uint _cardIndex) public payable returns(uint){
  
 _cardIndex = 5000;
 randNonce++;   

cardIndexToAddress[uint(keccak256(abi.encodePacked(now, msg.sender, randNonce))) % _cardIndex] = msg.sender;

 return uint(keccak256(abi.encodePacked(now, msg.sender, randNonce))) % _cardIndex;
