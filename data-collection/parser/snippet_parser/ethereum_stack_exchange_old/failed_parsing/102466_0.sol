contract Settings(){
  uint256 public fooValue = 1;

  function setFooValue(uint256 x){
    fooValue = x;
  }
}

contract MyContract(){
  settings Settings = Settings(0x1234...)
  
  function doSomething() public {
    uint256 foo = settings.fooValue()
  }
}
