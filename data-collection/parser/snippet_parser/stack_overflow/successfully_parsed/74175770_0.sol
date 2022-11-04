function voteForCandidate(string[] calldata names, string[][] calldata vote ) public returns (bool){
  require(owner == msg.sender, "Only owner can call this function");
  string memory artistas;
  for(uint i = 0; i < vote.length; i++) {
    artistas = "[";
    for(uint y = 0; y < vote[i].length; y++)
    {  
       artistas = append(artistas, " , ", vote[i][y]);
       votesReceived[vote[i][y]] += 1;         
    }
     artistas = append(artistas, " ] ", "");
    emit Vote(names[i], artistas);
}
return true;
}