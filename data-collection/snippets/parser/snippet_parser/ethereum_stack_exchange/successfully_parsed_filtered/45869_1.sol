pragma solidity ^0.4.21;

contract TransferTest {

        function TransferTest() payable{
        }

        function withdrawEther(uint amount, address sendTo) external {
            sendTo.transfer(amount);
        }

        function getBalance() public view returns (uint){
            return this.balance;
        }
}
