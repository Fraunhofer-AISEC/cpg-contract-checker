pragma solidity ^0.4.0;

contract mycontract {    
  struct student {
    bytes32 sid;
    string name;
    uint64 gender;
  }

  mapping (bytes32 =>student) s1;
  student[] public stu;

  function setstudent(bytes32 sid, string name, uint64 gender) public {        
    s1[sid].sid=sid;
    s1[sid].name=name;
    s1[sid].gender=gender;
  }

  function getstudent(bytes32 sid) public constant returns(bytes32, string, uint64) {
    return(s1[sid].sid,s1[sid].name,s1[sid].gender);
  }
}
