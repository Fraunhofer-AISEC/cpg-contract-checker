 function levelUp(uint _fighterId) external payable {
    require(msg.value == .001 ether);
    leveladd = fighters[_fighterId].level + 1;
    fighters[_fighterId].level = leveladd;
}
