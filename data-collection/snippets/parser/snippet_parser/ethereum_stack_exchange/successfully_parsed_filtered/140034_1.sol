


pragma solidity 0.8.8;

import "./simplestorage.sol";

contract Storage {

    simplestorage[] public cons;

function createsimplestorage() public{
    simplestorage cont=new simplestorage();

    cons.push(cont);
    }

function storevalueincontract(uint _index, uint _value) public{
simplestorage con = simplestorage[_index];
con.store(_value);
}


function viewvaluestoredinacontract(uint _index) public view returns(uint){
simplestorage con= simplestorage(simplestorage[_index]);
return con.retrieve();

}
}