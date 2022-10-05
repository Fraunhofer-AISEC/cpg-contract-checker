pragma solidity ^0.4.24; 
contract Test{

struct student{
uint bonus;
uint value1;
uint value2;
uint Priority;  
 }


mapping(address => student) students ; 
declaration of a function of type mapping so we define array of addresses
address [] public student_list;  

function Recieve_Request(address _address,uint _bonus, uint _value1, uint 
_value2) public {          

var student = students[_address]; 
 students mapping
student.bonus=_bonus;
student.value1=_value1;
student.value2=_value2;
student.Priority=(0.5 * _value1 + 0.5 * _value2)/ _bonus;  

 student_list.push(_address) -1;
     }


      function get_ESU(address ins) view public returns (uint, uint, uint) {
    return (students[ins].value1, students[ins].value2, 
  students[ins].Priority);
}

}
