pragma solidity ^0.4.15;
contract NDA {
bytes32  party1name;
bytes32  party2name; 
bytes32  pary1regaddr;

event Setparty2 (address indexed _from,bytes32 _party2name);
function NDA() {
    party1name = "Me";
}

function setparty2(bytes32 _party2name, bytes32 _pary1regaddr){
    party2name = _party2name;
    pary1regaddr = _pary1regaddr;
    Setparty2(msg.sender, _party2name);
}

function get() constant returns (bytes32, bytes32) {
    return (party1name, party2name);
}
}
