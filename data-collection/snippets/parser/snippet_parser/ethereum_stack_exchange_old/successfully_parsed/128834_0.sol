contract AlienCodexFactory is Level {

  function createInstance(address _player) public payable returns (address) {
    _player;
    return address(new AlienCodex());
  }

  function validateInstance(address payable _instance, address _player) public returns (bool) {
    
    AlienCodex instance = AlienCodex(_instance);
    return instance.owner() ==_player;
  }
}
