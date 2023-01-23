contract CannonMultiSender {

using SafeMath for uint256;

address public owner;
uint16 public arrayLimit = 150;
uint256 public feePerAddrs = 0.01 ether;

mapping(address => uint256) public txCount;


event EthAirdrop(address indexed by, uint256 totalTransfers, uint256 ethValue);

event FeeChanged(uint256 from, uint256 to);
event FeesClamied(address by, uint256 amount);
event SentChange(address to, uint256 amount);

constructor() {
    owner = msg.sender;
}


function multiValeEthAirdrop(address[] memory _to, uint256[] memory _amount) public payable {
    uint256 totalEthValue = _getTotalEthValue(_amount);
    uint256 dynamicFee = feePerAddrs.mul(_to.length);
    uint256 totalCost = totalEthValue.add(dynamicFee);

    require(_to.length <= arrayLimit, "You can only transfer to >= 150 accounts at a time due to gas limits.");
    require(_to.length == _amount.length, "The amount of recepients and values must be the same,");
    require(totalCost <= msg.value, "Not enough funds to complete transaction.");

    uint8 i = 0;
    for (i; i < _to.length; i++) {
        payable(_to[i]).transfer(_amount[i]);
    }

    txCount[msg.sender]++;
    giveChange(totalCost);

    emit EthAirdrop(msg.sender, _to.length, totalEthValue);
}

function singleValueEthAirdrop(address[] memory _to, uint256 _amount) public payable {
    uint256 dynamicFee = feePerAddrs.mul(_to.length);
    uint256 totalCost = _amount.mul(_to.length).add(dynamicFee);
    
    require(_to.length <= arrayLimit, "You can only transfer to >= 150 accounts at a time due to gas limits.");
    require(totalCost <= msg.value, "Not enough funds to complete transaction.");

    uint8 i = 0;
    for (i; i < _to.length; i++) {
        payable(_to[i]).transfer(_amount);
    }

    txCount[msg.sender]++;
    giveChange(totalCost);

    emit EthAirdrop(msg.sender, _to.length, _amount.mul(_to.length));
}


function _getTotalEthValue(uint256[] memory _values) internal pure returns(uint256) {
    uint256 totalVal = 0;
    for(uint i = 0; i < _values.length; i++) {
        totalVal = totalVal.add(_values[i]);
    }
    return totalVal;
}


function giveChange(uint256 _price) internal {
    if(msg.value > _price) {
        uint256 change = msg.value.sub(_price);
        payable(msg.sender).transfer(change);

        emit SentChange(msg.sender, change);
    }
}


function changeFeePerAddrs(uint256 _newFee) public onlyOwner {
    feePerAddrs = _newFee;

    emit FeeChanged(feePerAddrs, _newFee);
}


function claimFees(uint256 _amount) public onlyOwner {
    require(address(this).balance >= _amount, "Not enough funds to withdraw.");
    payable(owner).transfer(_amount);

    emit FeesClamied(msg.sender, _amount);
}


function getContractBal() public view returns (uint256) {
    return (address(this).balance);

}

modifier onlyOwner() {
    require(msg.sender == owner, "This function is for the owner only.");
    _;
}
}