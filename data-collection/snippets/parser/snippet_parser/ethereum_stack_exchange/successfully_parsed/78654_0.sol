     event BattleResult(string result,uint playerResult, uint enemyResult);
     mapping(address => uint)playerChoice;

     function setChoice(uint _number)public {
         playerChoice[msg.sender] = _number
        }

     function battle(address _target) public {
      playerValue = playerChoice[msg.sender];
      enemyValue = playerChoice[_target];
      if(playerValue > enemyValue){
       emit Battleresult("win",playerValue,enemyValue);
       }
      else if(playerValue < enemyValue){
       emit Battleresult("lose",playerValue,enemyValue);
       }
      else if(playerValue == enemyValue){
       emit Battleresult("draw",playerValue,enemyValue);
       }

}
