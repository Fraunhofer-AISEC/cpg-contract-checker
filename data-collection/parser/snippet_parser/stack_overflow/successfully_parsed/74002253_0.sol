
pragma solidity ^0.8.7;
 
import "@openzeppelin/contracts/access/Ownable.sol";
 

struct Appliance {
    uint256 id;
    string name;
    bool status;
    bytes1 pin;
}
 
contract HomeAutomationDemo is Ownable {
    uint256 nextId = 1;
    uint256 count = 0;
    mapping(uint256 => Appliance) public appliances;
 
    
    function addAppliance(string memory name, bytes1 pin) public onlyOwner {
        appliances[nextId] = Appliance(nextId, name, false, pin);
        nextId++;
        count++;
    }
 
    
    function removeAppliance(uint256 id) public onlyOwner {
        delete appliances[id];
        count--;
    }
 
    
    
    function toggleAppliance(uint256 id, bool status) public onlyOwner {
        appliances[id].status = !appliances[id].status;
    }
 
    
    function updateAppliance(uint256 id, string memory name, bytes1 pin) public onlyOwner {
        appliances[id].name = name;
        appliances[id].pin = pin;
    }
 
    
    function getAppliance(uint256 id) public view returns (Appliance memory) {
        return appliances[id];
    }
 
    
    function getAppliances() public view returns (Appliance[] memory)  {
        Appliance[] memory result = new Appliance[](count);
        for (uint256 i = 0; i < nextId; i++) {
            if (appliances[i].id != 0) {
                result[i] = appliances[i];
            }
        }
        return result;
    }
 
    
    function getAppliancesCount() public view returns (uint256) {
        return count;
    }
 
}
