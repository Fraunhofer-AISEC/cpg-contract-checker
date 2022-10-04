pragma solidity ^0.5.0;

contract Platoonfactory {
    event PlatoonCreated(address owner, uint256 platoonId);

    uint256 public currentPlatoonID = 1;
    uint256 public contractBalance = address(this).balance;

    
    struct Platoon {
        uint256 platoonId;
        address payable owner;
        uint costPerMinute;
        uint startDate;
        uint endDate;
        
        mapping(uint  => TruckInPlatoon) participants;
        uint participantsSize;
    }

    
    struct TruckInPlatoon {
        uint platoonId;
        address truckOwner;
        uint startDate;
        uint allowedParticipationUntilDate;
        uint payedAmountOfWei;
    }

    
    mapping(address => uint) public platoonOwners;
    
    mapping(uint => Platoon) public platoons;


    
    function createPlatoon(uint cpm, uint endDate) public returns (uint) {
        require(platoonOwners[msg.sender] == 0, "You have already started a platoon");
        require(endDate >= 1, "Platoon must at least be available for one hour");

        
        platoons[currentPlatoonID] = Platoon({platoonId: currentPlatoonID, owner: msg.sender, costPerMinute: cpm, startDate: now, endDate: (now + endDate*3600), participantsSize:0});
        platoonOwners[msg.sender] = currentPlatoonID;

        
        currentPlatoonID++;

        
        emit PlatoonCreated(msg.sender, currentPlatoonID);
        return currentPlatoonID - 1;
    }

}
