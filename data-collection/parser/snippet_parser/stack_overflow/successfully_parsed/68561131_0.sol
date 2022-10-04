function createZombie() public payable {
  require(msg.value >= feeCreateZombie);
  zombie memory myZombie;
  myZombie.name = "newbie";
  myZombie.dna = uint(keccak256( abi.encodePacked(now,msg.sender))) % 5;
  myZombie.level = 1;
  myZombie.cooldown = now;
  zombieToOwner[zombies.push(myZombie) - 1] = msg.sender;
}
