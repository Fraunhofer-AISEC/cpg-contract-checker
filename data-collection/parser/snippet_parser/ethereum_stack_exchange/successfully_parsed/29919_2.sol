contract Owned {

address private owner;


function Owned() {
    owner = msg.sender;
}

address private newOwner;




function changeOwner(address _newOwner) {

    if (msg.sender != owner)
        revert();

    newOwner = _newOwner;

}

function getOwner() public returns (address) {

    return owner;

}


function acceptOwnership() {
    if (msg.sender == newOwner) {
        owner = newOwner;
        newOwner = 0x0000000000000000000000000000000000000000;
    }
}
}
