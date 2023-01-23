contract Thing{
  uint public number;
  function Thing(bytes32 _number){
    number = uint(_number);
  }
}
