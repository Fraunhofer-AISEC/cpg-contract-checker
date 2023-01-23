
contract Receiver {

    receive() external payable {}
}

contract Sender {

    Receiver public receiver;

    constructor(address payable _receiverAddress) payable {
        receiver = Receiver(_receiverAddress);
    }

    function preferedMethod() external returns(bool){
        (bool success,) = payable(receiver).call{value: address(this).balance}("");
        return success;
    }

    
    function transferEth() external {
        payable(receiver).transfer(address(this).balance);
    }

    
    function sendEth() external returns(bool){
        bool success = payable(receiver).send(address(this).balance);
        return(success);
    }
}
