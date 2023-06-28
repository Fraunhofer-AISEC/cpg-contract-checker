  function toDoSomething1() public view OnlyOwner1() {
      if(msg.sender != _onwer) {
          revert NotOwner();
      } 
      
  }
