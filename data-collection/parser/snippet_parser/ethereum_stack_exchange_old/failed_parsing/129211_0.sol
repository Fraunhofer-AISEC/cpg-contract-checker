

pragma solidity ^0.6.8;

pragma experimental ABIEncoderV2;

contract INCUBE{



struct project {        
    string universal_project_id;        
    string project_title;              
    string project_details;              
    string[][] add_group_members;  
}

mapping (address => project) public Projects;          

string[][] public group_members;       
string [] public student;              

function add_students(string memory _name, string memory _roll_number, string memory _email, string memory _phone ) public {


    student.push(_name);
    student.push(_roll_number);
    student.push(_email);
    student.push(_phone);
    group_members.push(student);
}



function add_project_details(string memory _universal_project_id, string memory _project_title, string memory _project_details ) public {

    Projects[msg.sender] = project(_universal_project_id,_project_title,_project_details,group_members);
    delete group_members;
    delete student;
}

function getProject() public view returns(string memory, string memory, string memory)
{
    returns (Projects.universal_project_id,Projects.project_title,Projects._project_details)
}
}
