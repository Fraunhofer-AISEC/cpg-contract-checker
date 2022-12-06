mapping(address => uint256) public totalContributions;

function contribute(uint _campaignID, uint _amount) public {
    ...

    
    totalContributions[msg.sender] += _amount;
}





function getMyContributions() external view returns (uint256) {
    return totalContributions[msg.sender];
}
