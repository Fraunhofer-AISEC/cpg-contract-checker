  pragma solidity 0.6.4;
contract Storage{    
    uint [] public ids;
    string [] public activityNames;
    string [] public authorNames;
    string [] public activityTypes;
    
    function add(uint id, string memory activityName, string memory authorName, string memory activityType) public {
        ids.push(id);
        activityNames.push(activityName);
        authorNames.push(authorName);
        activityTypes.push(activityType);
    }
}