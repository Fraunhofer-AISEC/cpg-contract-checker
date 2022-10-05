pragma solidity ^0.4.2;
contract Something {
    mapping (address => Ton[]) allTons;

    struct Ton { 
        uint id;
        string name;
        bool access;
    }

    function Something() public {
        allTons[msg.sender].push(Ton({
            id: 1,
            name: "CoolDude",
            access: true
        }));
        allTons[msg.sender].push(Ton({
            id: 2,
            name: "NotCoolDude",
            access: false
        }));
    }

    function GiveBytes() public constant returns(bytes){
        

    }


}
