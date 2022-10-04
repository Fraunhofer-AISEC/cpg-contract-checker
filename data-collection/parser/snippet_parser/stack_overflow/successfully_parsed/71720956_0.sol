contract xxxMarket {

    Xxx xxxContract;
    uint256 public comissionFee;
    address _owner = msg.sender;
    mapping(uint256 => uint256) listPrice;
     constructor(Xxx xxxAddress, uint256 fee) {
        xxxContract = xxxAddress;
        comissionFee = fee;
    }
}