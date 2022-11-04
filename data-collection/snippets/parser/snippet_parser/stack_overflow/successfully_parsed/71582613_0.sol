struct PoliticalParty{
string name;
uint256 voteCount;
}

PoliticalParty[] public winners;
uint256 public winnercount;
function declareWinner()public onlyOwner returns(PoliticalParty[]memory)
{
require(votingState==State.Canceled||block.number>endBlock);
if(votingState==State.Canceled){
revert("Voting is canceled.");
}

else{
string memory_name="";
uint256 max_count=parties[0].voteCount;

for(uint256i=1;i<parties.length;i++){
if(parties[i].voteCount>max_count){
max_count=parties[i].voteCount;
}
}

for(uint256j=0;j<parties.length;j++){
if(max_count==parties[j].voteCount){
_name=parties[j].name;
winners.push(PoliticalParty({name:_name,voteCount:max_count}));
winnercount++;
}
}
return winners;
}
}
