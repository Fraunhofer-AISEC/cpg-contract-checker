pragma solidity ^0.4.2;
contract test {

  struct my_struct {
    int a;
  }

  mapping (address=>my_struct[]) Map;

  function fill_map(my_struct struct1,my_struct struct2) internal  {

    Map[msg.sender].push(struct1);
    Map[msg.sender].push(struct2);

  }
}
