contract test {
  address public _onwer;

  error NotOwner();

  modifier OnlyOwner1() {
      if(msg.sender != _onwer) {
          revert NotOwner();
      }
      _;
  }

  function OnlyOwner2() private view {
      if(msg.sender != _onwer) {
          revert NotOwner();
      } 
  }

  function toDoSomething1() public view OnlyOwner1() {
      
  }

  function toDoSomething2() public view {
      OnlyOwner2();
      
  }
}
