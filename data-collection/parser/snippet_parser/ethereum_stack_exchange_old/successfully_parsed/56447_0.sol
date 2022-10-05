pragma solidity ^0.4.24;

contract sec
{

    uint age= 15;
    uint agePer;

    modifier onlyPer (){

        if(age==agePer)
        {
            _;
        }
    }

    function getage(uint agep) onlyPer() public returns (uint){

        agePer=agep;
        return agePer;
    }
}
