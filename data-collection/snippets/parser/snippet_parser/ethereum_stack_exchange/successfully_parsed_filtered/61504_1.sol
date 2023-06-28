pragma solidity ^0.4.25;

contract GiveRefreceId {

    mapping(address => uint256) public referenceid;
    address[] public clients;
    uint256 idcounter;

    event createdId(address user, uint256 id);

    function giveRefrenceId() public returns (uint256)  { 
        require(referenceid[msg.sender]==0);
        idcounter += 1;
        clients.push(msg.sender);
        referenceid[msg.sender] = idcounter;
        emit createdId(masg.sender,idcounter);
        return idcounter;

    }


    function  getrefrnceId() public view returns(uint256) {
        return referenceid[msg.sender];
    }
}
