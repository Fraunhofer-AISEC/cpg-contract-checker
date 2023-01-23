contract test {
    address public owner;
    address payable public receiverContract;

    constructor(address payable _receiverContract) payable{
       receiverContract = _receiverContract;
        owner = msg.sender;
    }

    function sendEther() public payable {
        receiverContract.transfer(msg.value);
    }

    receive() external payable {
  }
}
