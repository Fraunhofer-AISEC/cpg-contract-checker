

pragma solidity >=0.7.1;

contract mappingInSolidity2 {
    mapping(uint => string) public sentances;
    mapping(string => uint) public indexes;
    
    function setSentance(uint _index, string memory _sentance) public {
        sentances[_index] = _sentance;
        indexes[_sentance] = _index;
    }
}
