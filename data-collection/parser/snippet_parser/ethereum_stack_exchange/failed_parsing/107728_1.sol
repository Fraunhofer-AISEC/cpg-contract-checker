  uint256 public num;
  Event NumberSetted(uint256 num);

  function setNum(uint256 _num) public {
    num= _num;
  emit NumberSetted(_num);
  }
