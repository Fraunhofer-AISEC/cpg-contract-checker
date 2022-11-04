pragma solidity ^0.4.18;

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

    
    

    function getTonAtRow(address user, uint row) public constant returns(uint, string, bool) {
        return(allTons[user][row].id, allTons[user][row].name, allTons[user][row].access);

    }

}
