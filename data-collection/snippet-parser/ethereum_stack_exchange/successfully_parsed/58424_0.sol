contract SimpleStore {

  uint public BetRound;
  uint public SelectedUser;

  struct Struct {
    uint _round;
    address _owner;
    uint _index;
    bool _active;
  }

  mapping(uint => Struct) public userIndexStruct;
  uint[] public userArray;

  function add(address _address) public {
    Struct storage accounts = userIndexStruct[userArray.length];
    accounts._round = BetRound+ 1;
    accounts._owner = _address;
    accounts._active = true;
    accounts._index = userArray.length;

    userArray.push(accounts._index);
  }

  function update(uint _index) public {
    userIndexStruct[_index]._round++;
  }

  function SetUsers() public returns (uint) {
      
      
      
      if(SelectedUser >= userArray.length ) {
          BetRound++;
          SelectedUser = 0;
      }

        for (uint i = SelectedUser; i < userArray.length; i++) {

          if (userIndexStruct[i]._round < BetRound) {
            if (userIndexStruct[i]._active) {
                
                
                update(i);
                SelectedUser = i;
                
                return i;
            }
          }
        }

        
        BetRound++;
  }

}
