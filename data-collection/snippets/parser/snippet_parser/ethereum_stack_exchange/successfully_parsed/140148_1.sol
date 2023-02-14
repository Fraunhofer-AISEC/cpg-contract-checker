
pragma solidity 0.6.1;

contract ExampleMapping1{
    struct Name{
        string yourName;
    }
    mapping(string => Name) public nameStruct;
    mapping(uint => string) names;

    function MyNames(uint _rNo,string memory _yourName) public{
        names[_rNo] = nameStruct[_yourName].yourName;
    }
}
