function buyNumber(uint256 _number) public payable {
      
      
      if(msg.value < 0.1 ether){
        revert("more eth!");
      }

      ...todoStuff

    }
