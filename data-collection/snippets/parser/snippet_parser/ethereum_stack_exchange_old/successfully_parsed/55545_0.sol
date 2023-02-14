function dashboard(bytes32[] candidateListNew) public returns(bytes32[])
        { for(uint i = 0; i < candidateListNew.length; i++){
        for(uint j = i+1; j < candidateListNew.length; j++){
            if(votesReceived[candidateListNew[i]] > votesReceived[candidateListNew[j]]){
                uint8 temp = votesReceived[candidateListNew[j]];
                votesReceived[candidateListNew[j]] = votesReceived[candidateListNew[i]];
                votesReceived[candidateListNew[i]] = temp;
        }
      }
    }
    return votesReceived[candidateListNew]; 
 } 

struct voter {
     bytes32 votedFor;
     bool hasVoted;
  }

  mapping (bytes32 => uint8) public votesReceived;
  
  mapping (bytes32 => voter) public voters;

  bytes32[] public candidateList;
  bytes32[] public candidateListNew;
