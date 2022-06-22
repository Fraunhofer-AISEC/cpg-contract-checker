 uint public amountRaised; 
 mapping (address => uint) contributionLedger;
 address[] public contributors;


 function fund() payable returns (bool) {
        if (msg.value == 0) { throw; }
        if (block.timestamp > deadline) { throw; }
        if (amountRaised > amountToBeRaised) { throw; }
        if (contributionLedger[msg.sender] == 0) { 
            contributors.push(msg.sender);
        }
        amountRaised += msg.value;
        contributionLedger[msg.sender] += msg.value; 
        return true; 
    }
