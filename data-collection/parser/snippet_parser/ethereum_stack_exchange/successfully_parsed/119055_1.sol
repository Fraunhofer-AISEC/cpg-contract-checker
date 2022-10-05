function levelUp(uint _fighterId) public payable {
require(msg.value == levelUpFee);
leveladd = fighters[_fighterId].level + 1;
 fighters[_fighterId].level = leveladd  ;
}
