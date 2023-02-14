function betOnTeam(uint team) public {
  emit LogInfo("Inside betOnTeam-----------");
  if(team == 1) {
    update();
  }
}   
