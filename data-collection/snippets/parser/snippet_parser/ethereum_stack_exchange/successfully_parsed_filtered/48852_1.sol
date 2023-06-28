uint32[100] public people;
uint8 public counter;

mapping (uint32 => bool) public alreadyVoted;

function vote(uint32 id) public returns(bool) {
  if (alreadyVoted[id]) return(false);
  alreadyVoted[id] = true;
  people[counter] = id;
  counter = counter + 1;
  return(true);
}
