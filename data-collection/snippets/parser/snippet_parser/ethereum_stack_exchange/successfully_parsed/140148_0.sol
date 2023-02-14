

pragma solidity 0.6.1;

contract ExampleMapping1{

    mapping(uint => string) names;

    struct Name{
        string yourName;
    }

    function MyNames(uint _rNo,string memory _yourName) public{
        names[_rNo] = Name[_yourName];
    }
}
