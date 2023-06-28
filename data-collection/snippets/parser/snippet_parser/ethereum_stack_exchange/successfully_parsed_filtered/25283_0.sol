struct ListMembers {
    bytes32 listOwner;
    bytes32[] members;
}
ListMembers public lm;
mapping(bytes32 => bool) public addedMembers;


function Lister(bytes32 listOwner) {
    lm.listOwner = listOwner;
    lm.members.length = 1;
    lm.members[0] = listOwner;
}

function buildList(bytes32[] listMembers) {
    lm.members.length = listMembers.length + 1;
    for (uint i = 0; i < listMembers.length; i++) {
        lm.members[i + 1] = listMembers[i];
    }
}
function addVote(bytes32 member, uint256 number) {
    if (memberAdded(member) == true) { 
        return;
    } else {
        addedMembers[member] = true; 
        if (memberIsOwner(member) == true) {
            
        } else {
            
        }
    }
}

function memberAdded(bytes32 member) returns (bool) {
    return addedMembers[member];
}

function allMembersVoted() returns (bool) {
    bool voted = true;
    for (uint i = 0; i < lm.members.length; i++) {
        voted = voted && addedMembers[lm.members[i]];
    }

    return voted;
}
