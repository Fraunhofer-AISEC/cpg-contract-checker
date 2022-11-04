pragma solidity ^0.4.19;

contract RPG {
    enum Armor {Chest, Helm, Boots, Leggings, Gloves, Shield} 
    enum Weapon {Sword, Axe, Wand, Gun, Hammer, Fist}

    struct CharacterStruct {string name;
                      bool isCharacter;
                      uint dna;
                      Armor[] armors; 
                      Weapon[] weapons;                  
        }

    mapping(address => CharacterStruct) public characterStructs;
    address[] public characters;

    modifier onlyIfRegistered() {
        require(characterStructs[msg.sender].isCharacter);
        _;
    }

    function register() public returns(bool success) {
        require(!characterStructs[msg.sender].isCharacter);
        characters.push(msg.sender);
        characterStructs[msg.sender].isCharacter = true;
        return true;
    }

    function addArmor(Armor a) public onlyIfRegistered returns(bool success) {
        characterStructs[msg.sender].armors.push(a);
        return true;
    }

    function getArmor(address player, uint row) public view returns(Armor armor) {
        return characterStructs[player].armors[row];
    }

}
