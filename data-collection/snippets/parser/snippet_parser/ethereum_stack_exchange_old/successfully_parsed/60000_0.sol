 pragma solidity ^0.4.24; 

  contract Test {



struct StudentType {
    uint8 bonus;        
    uint16 value1;      
    uint16 value2;      
    uint16 Priority;    
}

mapping (address => StudentType) public studentsByAddress; 
mapping (uint256 => address) public studentsByInsertId; 
uint256 public studentCount = 0;

function saveNewRecord(address _address, uint8 _bonus, uint16 _value1, uint16 _value2) public {          

    
    StudentType storage student = studentsByAddress[_address]; 
    student.bonus = _bonus;
    student.value1 = _value1;
    student.value2 = _value2;

    student.Priority = this.calculatePriority( _value1, _value2, _bonus);

    
    
    
    studentsByInsertId[studentCount++] = _address;

}



function calculatePriority(uint16 _value1, uint16 _value2, uint8 _bonus) pure public returns ( uint16 ) {
    
    uint256 result = ( ( ( 50 * _value1 ) + ( 50 * _value2 ) ) / _bonus ) / 100;

    
    return uint16( result );
}


function get_ESU(address ins) view public returns (uint, uint, uint) {
    return (
        studentsByAddress[ins].value1,
        studentsByAddress[ins].value2,
        studentsByAddress[ins].Priority
    );
}

 }
