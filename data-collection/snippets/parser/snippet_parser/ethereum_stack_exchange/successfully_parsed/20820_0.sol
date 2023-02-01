struct RegisteredCandidate {
    bytes32 ownerID;
    address clientAddress;
}

mapping( bytes32=> RegisteredCandidate) registeredCandidates;
bytes32[] registeredClients; 


modifier ifIssuer() {
            if (issuer != msg.sender){
                  revert();
              }
              else {
                _;
     }
    }

function registerClient(bytes32 _clientID) public returns (bool) {

      
      if(registeredCandidates[_clientID].ownerID != _clientID) {

          registeredCandidates[_clientID].ownerID = _clientID;
          registeredCandidates[_clientID].clientAddress = msg.sender;
          registeredClients.push(_clientID); 
          return true;
      }

      return false;
  }

    function getRegisteredClients() constant returns (uint) {
        registeredClients.length;

    }  
