pragma solidity 0.8.7;

contract SendAndTransferEther {
    
    event payableMessage(address _from, address _to, uint256 amount);

    receive() external payable {}

    function checkBalance() public payable returns(uint) {
        return  address(this).balance;
    }

    function checkBalanceMsg() external payable returns(uint) {
        return msg.value;
    }
}
