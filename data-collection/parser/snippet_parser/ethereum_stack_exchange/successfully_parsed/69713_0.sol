contract StoForwarder is Controllable {

    constructor(address _controller, address _controllerAgent) public Controllable(_controller, _controllerAgent) {}

    event NewTask(bytes5 txId, address forwardAddress, address refundAddress, address tokenContract,
        bytes32 partition, uint256 amount);

    struct Task {
        bytes5 txId;
        address forwardAddress;
        address refundAddress;
        IERC1410 tokenContract;
        bytes32 partition;
        uint256 amount;
    }

    mapping (bytes5 => Task) public pendingTasks;

    function callback(IERC1410 _stoContract, bytes32 _partition, uint256 _amount, bytes calldata _data) external {
        require(_data.length >= 46, "Insufficient data provided");
        byte operCode;
        bytes5 txId;
        address forwardAddress;
        address refundAddress;
        (operCode, txId, forwardAddress, refundAddress) = abi.decode(_data, (byte, bytes5, address, address));

        require(txId != "", "TransactionId not specified");
        require(_partition != "", "Bad Partition");
        require(forwardAddress != address(0), "Bad Forward Address");
        require(refundAddress != address(0), "Bad refund Address");

        pendingTasks[txId].txId = txId;
        pendingTasks[txId].forwardAddress = forwardAddress;
        pendingTasks[txId].refundAddress = refundAddress;
        pendingTasks[txId].tokenContract = _stoContract;
        pendingTasks[txId].partition = _partition;
        pendingTasks[txId].amount = _amount;

        emit NewTask(txId, forwardAddress, refundAddress, address(_stoContract), _partition, _amount);
    }

    function controllerTransfer(bytes5 txId, bool forward) onlyController external {
        require(pendingTasks[txId].txId != "");
        Task storage task = pendingTasks[txId];
        address targetAddress;

        if (forward) {
            targetAddress = task.forwardAddress;
        } else {
            targetAddress = task.refundAddress;
        }

        task.tokenContract.transferByPartition(task.partition, targetAddress, task.amount, "");
    }
}
