

pragma solidity 0.8.12;

contract EthTransfer{
    address public sender;
    address public receiver;

    constructor(){
        receiver = msg.sender;
    }

    receive() external payable{
        sender = payable(msg.sender);
    }

    function getContractBalance() public view returns(uint){
        return address(this).balance;
    }

    function getContractAddress() public view returns(address){
        return address(this);
    }

    function transferEth() public {
        payable(receiver).transfer(getContractBalance());
    }
}
