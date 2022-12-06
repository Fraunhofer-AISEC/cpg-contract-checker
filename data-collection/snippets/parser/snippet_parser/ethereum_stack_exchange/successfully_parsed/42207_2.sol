
function withdrawAll2() public {
      Locker[] memory memLockers = lockersByAddress[msg.sender];
      
      delete lockersByAddress[msg.sender];
      for (uint i = 0; i < memLockers.length; i++) {
        if (memLockers[i].creationTime + memLockers[i].holdTime < now) {
          msg.sender.transfer(memLockers[i].balance);
          Withdrawal(msg.sender, memLockers[i].balance);
        }
      }
    }
