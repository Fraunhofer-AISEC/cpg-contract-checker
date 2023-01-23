pragma solidity ^0.6.0;

contract ZooFactory {

    event NewZoo(uint zooId, string name, uint dna);

    uint dnaDigits = 24;
    uint dnaModulus = 10 ** dnaDigits;

    struct Zoo{
        string name;
        uint dna;
    }

    Zoo[] public zoos;



    function createZoo(string memory _name, uint _dna) private {
        uint id = zoos.push(Zoo(_name, _dna)) - 1;
        NewZoo(id, name, dna);
    }

    function generateRandomDna(string memory _str) private view returns(uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str));
        return rand % dnaModulus;
    }

    function createRandomZoo(string memory _name) public {
        uint randDna = _generateRandomDna(_name);
        createZoo(_name, randDna);
    }
}
