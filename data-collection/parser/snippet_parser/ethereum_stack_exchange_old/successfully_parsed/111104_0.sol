contract assemblyMappingTest{
  mapping(address => uint) public assets;

  function save(address _user, uint _amount) public
  {
     assets[_user] = _amount;
  }

  function saveWithAssembly(address _user, uint _amount) public
  {
     assembly {
        
     }     
  }
}
