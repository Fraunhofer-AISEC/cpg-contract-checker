pragma solidity ^0.4.24;
contract DataBase {
    function increaseUnitExp(uint _id, uint amount) public;
}
contract Quests {

    DataBase dc;

    constructor(address _dataContract) public {
        dc = DataBase(_dataContract);
    }

    
    function increaseMonsterExp(uint _id, uint _amount) public {
        dc.increaseUnitExp(_id, _amount);
    }

}
