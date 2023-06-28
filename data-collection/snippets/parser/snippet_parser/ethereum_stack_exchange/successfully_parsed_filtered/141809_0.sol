function testDeposit() public {
      vm.prank(0x30bE4D758d86cfb1Ae74Ae698f2CF4BA7dC8d693);
      assertGt(punks.balanceOf(myAddress), 1);
      assertEq(punks.ownerOf(4), myAddress);
      
      emit log_named_address("Current address of sender", msg.sender);
      punks.approve(address(Storage), 4);
      
    }
