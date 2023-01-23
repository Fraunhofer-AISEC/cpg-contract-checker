interface Challenge { 
    function winners() external view returns(bool);
  }
  
contract WinnersHack {
    address[] public array;
    address challengeAddress = 0xcD7........;
    address winner = 0x0C5........;
    Challenge challengeInstance = Challenge(challengeAddress);
 
    function showWinner() public view returns(bool) {   
        array = challengeInstance.winners();
        for (uint i = 0; i < array.length; i++) {
            if (array[i] == winner) {
                return true;  
            }
        }
    }
