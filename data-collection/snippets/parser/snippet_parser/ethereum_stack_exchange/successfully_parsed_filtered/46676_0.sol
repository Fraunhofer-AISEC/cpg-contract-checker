pragma solidity ^0.4.19;

contract EggFactory{

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits; 

    event NewEgg(uint eggId, uint dna);

    struct Egg{
        uint dna;
        uint createdAt;
        bool hatched;
    }

    Egg[] public eggs;

    mapping (uint => address) public eggToOwner;
    mapping (address => uint) ownerEggCount;

    function createEgg(uint _dna) public{
        uint id = eggs.push(Egg(_dna,now,false)) - 1;
        eggToOwner[id] = msg.sender;
        ownerEggCount[msg.sender]++;
        emit NewEgg(id, _dna);
    }

    function generateRandomDna() private view returns (uint){
        
        uint rand = uint256(keccak256(now, block.blockhash));
        return rand % dnaModulus;
    }

    function createRandomEgg() public{
        require(ownerEggCount[msg.sender] == 0);
        uint randDna = generateRandomDna();
        createEgg(randDna);
    }
}
