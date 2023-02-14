pragma solidity >=0.4.24;
contract Registration {
struct MultiSig
{
    address institute;
    address student;
Documents documents;   
}
mapping(address=>MultiSig) public wallets ;
function createNewMultiSigbyUser(address instituteaddress) public {
        var wa = wallets[msg.sender];
        wa.institute = instituteaddress;
        wa.studend = msg.sender;
}
}
