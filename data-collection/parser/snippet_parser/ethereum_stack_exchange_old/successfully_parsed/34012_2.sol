pragma solidity ^0.4.23;

contract Something {

    mapping (address => Ton[]) public allTons;

    struct Ton { 
        uint id;
        string name;
        bool access;
    }

    constructor() public {

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

    
    

    function getTonCount(address _address) public view returns (uint _count) {
        _count = allTons[_address].length;        
    }

}
