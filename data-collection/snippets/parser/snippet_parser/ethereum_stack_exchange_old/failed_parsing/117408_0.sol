pragma solidity ^0.8.11;

contract SantaList {

    struct NaughtyList{
        string badBoy;
        uint position;
    }
    struct NiceList{
        string goodBoy;
        uint position;
    }

    NaughtyList[] public badNames;
    NiceList[] public goodNames;

    uint internal nextPosition = 1;

    function AddToBadList(string memory badBoy) public{
        badNames.push(NaughtyList(badBoy, nextPosition));
        nextPosition++;
    }

    function AddToNiceList(string memory goodBoy) public{
        goodNames.push(NiceList(goodBoy, nextPosition));
        nextPosition++;
    }

    function GetNaughtyList() view public returns(NaughtyList[] memory){
        return badNames;
    }

    function GetNiceList() view public returns(NiceList[] memory){
        return goodNames;
    }

    function CheckList(string memory name) public {
        for(uint i = 0; i < badNames.length; i++){
            if(badNames[i].badBoy == **badBoy**){
                return **badBoy**;
                return " is on the naughty list";
            }
        }
    }
    
}
