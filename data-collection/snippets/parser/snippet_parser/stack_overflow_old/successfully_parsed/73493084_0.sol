
pragma solidity ^0.8.16;

struct MLevel{
    address id;
    string levelPrize;
    uint levelNo;
    uint levelCriteria;
}

contract Test{

  MLevel[] public mlevels;

    function addLevel(uint _levelCriteria, string memory _levelPrize)public payable{
        MLevel memory level;
        level.id = msg.sender;
        level.levelCriteria = _levelCriteria;
        level.levelPrize = _levelPrize;
        mlevels.push(level);
    }

    function getLevels() public view returns(MLevel [] memory){
        return mlevels;
    }

}
