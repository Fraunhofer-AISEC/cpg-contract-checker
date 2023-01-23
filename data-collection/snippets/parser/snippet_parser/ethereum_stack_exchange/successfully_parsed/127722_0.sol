 address[] funders;
uint256 fundersCounter;
address[3] topFunders;

mapping(address => uint256) fundedAmount;
mapping(address => uint256) funderId;
mapping(uint256 => address) funderIdToAddress;

receive() external payable {
    fundedAmount[msg.sender] += msg.value;
    funders.push(msg.sender);

    if(funderId[msg.sender] == 0) {
        fundersCounter++;
        funderId[msg.sender] = fundersCounter;
        funderIdToAddress[fundersCounter] = msg.sender;
    }
}

function viewFunders() public view returns(address[] memory) {
    return(funders);
}

function checkTopFunder() public {
    uint256 i = 0;
    uint256 j = 1;
    for(i; i < funders.length; i++) {
    }
}
