struct Locker {
  uint creationTime;
  uint holdTime;
  uint balance;
}

mapping (address => Locker[]) lockersByAddress;

function withdrawAll() public {
  Locker[] storage lockers = lockersByAddress[msg.sender];
  for (uint i = 0; i < lockers.length; i++) {
    if (lockers[i].creationTime + lockers[i].holdTime < now) {
      msg.sender.transfer(lockers[i].balance);
      Withdrawal(msg.sender, lockers[i].balance);
      delete lockers[i];
    }
  }
}
