mapping (address => Count) private counts;

function getCounts (address user)
public
view
returns(uint a, uint b, uint total){
  return(counts[user].a, counts[user].b, counts[user].total);
}
