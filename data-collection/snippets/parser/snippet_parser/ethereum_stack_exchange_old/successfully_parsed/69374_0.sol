pragma solidity ^0.4.18;

contract graduate{
     uint studentId;
     string name;
     string major;
     uint totalGrade;

     function setGraduate(uint x, string y, string z, uint v) public{
           studentId = x;
           name = y;
           major = z;
           totalGrade = v;
     }

    function getGraduate() public view returns (uint _studentId,string _name,string _major,uint _totalGrade){
          return studentId;
          return name;
          return major;
          return totalGrade;
    }

}
