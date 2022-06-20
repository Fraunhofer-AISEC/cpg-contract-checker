pragma solidity 0.5.2;

contract BuyPreimage {
    address payable buyer;
    address payable seller;
    bytes32 public hash;
    uint256 public deadline;

    constructor(address payable _seller, bytes32 _hash, uint256 timeout) public payable {
        buyer = msg.sender;
        seller = _seller;

        hash = _hash;
        deadline = now + timeout;
    }

    
    function providePreimage(bytes calldata preimage) external {
        require(keccak256(preimage) == hash);
        seller.transfer(address(this).balance);
    }

    
    function refund() external {
        require(msg.sender == buyer);
        require(now >= deadline);

        msg.sender.transfer(address(this).balance);
    }
}
