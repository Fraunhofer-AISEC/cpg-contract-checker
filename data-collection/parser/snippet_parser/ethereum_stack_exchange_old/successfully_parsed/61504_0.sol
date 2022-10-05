pragma solidity ^0.4.17;

contract GiveRefreceId {

    struct  referenceids {
        uint256 rid ;
        address addressrid;
}
    mapping(uint256 => referenceids) referenceid;
    referenceids[] lenrefrenceid;

function giveRefrenceId() public returns (uint256)  { 
    for (uint256 i=0 ;i<=lenrefrenceid.length; i++){

        require( lenrefrenceid[i]  != msg.sender);
    } 

    uint256 lenvarble = lenrefrenceid.length;

    referenceids  storage temprid = referenceid[lenvarble];

    temprid.rid = lenvarble;
    temprid.addressrid = msg.sender;
    lenrefrenceid.push(temprid);
    return lenvarble;
}

function  getrefrnceId()  view returns(uint256) {

return ((lenrefrenceid.length)-1);

}
}
