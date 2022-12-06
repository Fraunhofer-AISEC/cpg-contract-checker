pragma solidity ^0.4.21;

contract Get_data {
mapping(address => uint) public ration_id;
mapping(uint256 => owner_details) public owner_detail;



function set1(address _addr, uint _i) public {
    ration_id[_addr] = _i;
}

function set_rid() public {
    set1(0xDEE7796E89C82C36BAdd1375076f39D69FafE252, 1); 
    set1(0xDEE7796E89C82C36BAdd1375076f19D69FafE253, 2); 
    set1(0xDEE7796E89C82C36BAdd1371076f39D69FafE254, 3); 
}            

function Get_data(address _addr) public view returns(uint[] memory) {
    set_rid();
    uint[] memory arr;
    arr.push(owner_detail[ ration_id[_addr]].colorcode);
    arr.push(owner_detail[ ration_id[_addr]].annual_income);

    return  arr;
}

struct owner_details {
    string name;
    string gender;
    uint8 colorcode;
    uint256 annual_income;
}

function od_dir() public {
    var add_d;
   
    
    add_d = owner_detail[1];
    add_d.name = "John";
    add_d.gender = "male";
    add_d.colorcode = 1; 
    add_d.annual_income = 50000;
    
    
    add_d = owner_detail[2];
    add_d.name = "sam";
    add_d.gender = "female";
    add_d.colorcode = 2; 
    add_d.annual_income = 120000;
    
    
    add_d = owner_detail[3];
    add_d.name = "Jasmin";
    add_d.gender = "female";
    add_d.colorcode = 3; 
    add_d.annual_income = 500000;
  
}   
}
