
pragma solidity ^0.8.0;

contract Golem {
    int public hp = 100;
    int internal attack = 20;
    int private attackMod = 2;

    function takeDmg(int dmg) public{
        hp = hp - dmg;
    }

    function attackBasic() public view returns(int){
        return attack * attackMod;
    }
}

contract FireGolem is Golem {}
