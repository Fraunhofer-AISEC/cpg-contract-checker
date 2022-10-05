pragma solidity ^0.4.2;
contract test {    
  struct my_struct {
    int a;
    int my_length; 
  }

  mapping (address=>my_struct[]) Map;

  function fill_map(my_struct struct1,my_struct struct2) internal  {    
    Map[msg.sender].push(struct1);
    Map[msg.sender][0].my_length = Map[msg.sender][0].my_length + 1;

    Map[msg.sender].push(struct2);   
    Map[msg.sender][0].my_length = Map[msg.sender][0].my_length + 1;

    Map[msg.sender].push(struct3);
    Map[msg.sender][0].my_length = Map[msg.sender][0].my_length + 1;

    delete Map[id][2]; 
    Map[msg.sender][0].my_length = Map[msg.sender][0].my_length - 1;
  }
}
