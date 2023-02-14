contract assemblyMappingTest{
  mapping(address => uint) public assets;

  function save(address _user, uint _amount) public
  {
     assets[_user] = _amount;
  }

  function saveWithAssembly(address _user, uint _amount) public
  {
     assembly {
        mstore(0, _user)
        mstore(32, assets.slot)
        let hash := keccak256(0, 64)
        sstore(hash, _amount)
     }     
  }
}
