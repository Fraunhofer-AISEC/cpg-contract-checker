contract MetaCoin {

uint256 public balance = 0;

function getBalance() public view returns(uint) {
    return balance
   }

}
