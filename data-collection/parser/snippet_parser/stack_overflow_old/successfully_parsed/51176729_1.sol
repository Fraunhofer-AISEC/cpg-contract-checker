pragma solidity ^0.4.0;

import "browser/StringUtils.sol";



contract HomeListing {

    struct Home {
        uint id;
        string physicalAddress;
        bool available;
    }

    Home[] public homes;
    mapping (address => Home) hostToHome;
    event HomeEvent(uint _id);
    event Test(uint length);

    constructor() {

    }

    
    function addHome(string _physicalAddress) public {
        uint _id = uint(keccak256(_physicalAddress, msg.sender));
        homes.push(Home(_id, _physicalAddress, true));
    }

    
    
    function listHomesByAddress(string _physicalAddress) public returns(uint [] _id ) {
        uint [] results;
        for(uint i = 0 ; i<homes.length; i++) {
            string location = homes[i].physicalAddress;
            if(StringUtils.equal(location,_physicalAddress )) {
                results.push(homes[i].id);
            }
        }
        return results;
    }
}
