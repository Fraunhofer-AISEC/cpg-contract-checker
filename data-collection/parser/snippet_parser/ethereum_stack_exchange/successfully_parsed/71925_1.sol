pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;

contract Testing{

    struct personalInfo {
        uint id;
        string[] colors;
        bool player;
    }

    mapping(uint=> personalInfo) public personals;
    constructor () public {

    }    function updatePersonalInfo(uint _ID, string  memory _color, bool _player) public {
        personalInfo storage updateP = personals[_ID];
        updateP.id = _ID;
        updateP.player = _player;
        updateP.colors.push(_color);
    }
    function rPersonalInfo(uint id)public view returns(personalInfo memory p){
        return personals[id];
    }
}
