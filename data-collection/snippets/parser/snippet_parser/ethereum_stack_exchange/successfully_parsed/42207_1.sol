
contract Lockers {
    struct Locker {
      uint creationTime;
      uint holdTime;
      uint balance;
   }

   mapping (address => Locker[]) lockersByAddress;

   event Withdrawal(address sender, uint balance);

    function store(uint holdTime) external payable {
        Locker memory locker = Locker(now, holdTime, msg.value);
        lockersByAddress[msg.sender].push(locker);
    }

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

    function getNumLockers(address owner) external view returns(uint) {
        return lockersByAddress[owner].length;
    }

    function getLockerDetails(address owner, uint index) external view returns(uint creationTime, uint holdTime, uint balance) {
        Locker memory locker = lockersByAddress[owner][index];
        creationTime = locker.creationTime;
        holdTime = locker.holdTime;
        balance = locker.balance;
    }
}
