pragma solidity ^0.4.17;

contract Managers{

    struct Manager{
        uint index;
        bool isHead;
        bool isManager;
    }

    mapping(address => Manager) managerAddresses;
    address[] public managerAddressesArr;

    modifier isHead(address sender){
        require(managerAddresses[sender].isHead);
        _;
    }

    modifier isManager(address sender){
        require(managerAddresses[sender].isManager);
        _;
    }

    constructor(address[] _managerAddresses) public{
        for(uint i=0;i<_managerAddresses.length;i++){
            managerAddresses[_managerAddresses[i]] = Manager(i,false,true);
        }
        managerAddresses[msg.sender] = Manager(managerAddressesArr.length,true,false);
        managerAddressesArr = _managerAddresses;
        managerAddressesArr.push(msg.sender);
    }


}

contract UploadFactory is Managers{


}
