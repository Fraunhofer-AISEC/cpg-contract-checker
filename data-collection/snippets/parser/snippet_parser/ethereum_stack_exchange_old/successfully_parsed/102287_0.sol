pragma solidity >0.4.0;
contract admin{
struct patient{
string name;
uint age;
}

mapping(uint=>patient) public pdb;

function reg(uint id,string memory pname, uint p_age) public {
pdb[id].name=pname;
pdb[id].age=p_age;
}

}

contract user is admin{
function vacc_reg(uint id,string memory name, uint a) public{
   reg(id,name,a);
}
}
