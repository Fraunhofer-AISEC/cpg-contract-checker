contract Lister {
    struct ListMembers {
        bytes32[] members;
        uint256 averageNumber; 
        uint256 runningNumber;  
    }

    
    ListMembers public lm;

   function calculateAverageNumber() {        
        uint256 numMembers = uint256(lm.members.length);
        uint256 sampleSum = lm.runningNumber - lm.randomNumber;
        uint256 avgSum = sampleSum / numMembers;
        lm.averageNumber = avgSum;
    }

     function getAverageNumber() returns (uint256) {
        return lm.averageNumber;
    }
}