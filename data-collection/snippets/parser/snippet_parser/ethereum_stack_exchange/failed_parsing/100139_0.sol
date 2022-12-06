mapping (address => uint256) private balances; 
                                               

struct RoyaltyInfo {
    mapping (address => uint256) private balances_copy;
    uint256 private royalty;
}

RoyaltyInfo[] private royaltyInfomation;

function sendRoyalty() public payable {
    royaltyInformation.push(RoyaltyInfo(balances, msg.value)); 
}
