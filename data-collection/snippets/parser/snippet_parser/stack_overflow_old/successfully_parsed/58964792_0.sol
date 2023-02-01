pragma solidity ^0.5.7;

contract Voting{
    struct Option{
        string name;
        uint256 votes;
    }

    Option[] private options;
    address[] private alreadyVote;

    address private owner = msg.sender;

    constructor() public {}

    function addOption(string memory _name) public{
        require(msg.sender==owner,"Permiso denegado");
        options.push(Option(_name,0));
    }

    function vote(string memory _name) public{
        require(find(msg.sender,alreadyVote)==-1,"Ya ha ejercido su derecho a voto");
        int candidateIndex = findOption(_name);
        require(candidateIndex!=-1,"No se ha encontrado el candidato deseado");

        options[uint(candidateIndex)].votes++;

        alreadyVote.push(msg.sender);
    }

    function findOption(string memory _name) private view returns (int){
        int result = -1;
        for(uint i = 0;i<options.length;i++){
            if(compareStrings(options[i].name,_name))
                result = int(i);
        }
        return result;
    }

    function compareStrings (string memory a, string memory b) private pure returns (bool) {
        return (keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked((b))) );
    }

    function find(address ad, address[] memory v) private pure returns (int){
        int result = -1;
        for(uint i = 0;i<v.length;i++){
            if(v[i]==ad)
                result = int(i);
        }
        return result;
    }

    function concat(string memory _base, string memory _value) public pure returns (string memory) {
        bytes memory _baseBytes = bytes(_base);
        bytes memory _valueBytes = bytes(_value);

        string memory _tmpValue = new string(_baseBytes.length + _valueBytes.length);
        bytes memory _newValue = bytes(_tmpValue);

        uint i;
        uint j;

        for(i=0; i<_baseBytes.length; i++) {
            _newValue[j++] = _baseBytes[i];
        }

        for(i=0; i<_valueBytes.length; i++) {
            _newValue[j++] = _valueBytes[i];
        }

        return string(_newValue);
    }

    function getResult(string memory _name) public view returns (string memory ,uint){
        require(msg.sender==owner,"Denied");
        int index = findOption(_name);
        string memory error = concat("Didn't found candidate ",_name);
        require(index!=-1,error);

        return (options[uint(index)].name,options[uint(index)].votes);
    }
}
