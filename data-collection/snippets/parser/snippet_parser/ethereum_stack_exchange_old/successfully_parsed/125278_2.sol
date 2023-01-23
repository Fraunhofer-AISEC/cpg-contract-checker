Collectible collectibleContract;
Token tokenContract;
uint256 public comissionFee;
address _owner = msg.sender;
mapping(uint256 => uint256) collectiblePrice;
constructor(Collectible collectibleAddress, Token tokenAddress ,uint256 fee) {
    collectibleContract = collectibleAddress;
    tokenContract = tokenAddress;
    comissionFee = fee;
}
