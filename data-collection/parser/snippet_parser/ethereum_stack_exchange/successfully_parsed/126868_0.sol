 uint256 public totalCrowdFund;
bool refundStatus;

mapping(address => uint256) public balanceOf;
mapping(address => bool) public emergencyRefundStatus;

constructor() {
    owner = msg.sender;
    totalCrowdFund = 0;
}
