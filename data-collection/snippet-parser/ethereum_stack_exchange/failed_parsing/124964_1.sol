import `.....ChildContract.sol`

contract Factory {

   function deployChildContract(.....) external {
      ChildContract childContract = new ChildContract(......, msg.sender)
   }
}
