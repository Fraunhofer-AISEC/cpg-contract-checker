pragma solidity ^0.8.3;

contract ReceiveEther{

    fallback() external payable {}

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}

contract SendEther {

    uint balance;
    
    function invest() external payable{
         balance += msg.value;
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }


    function transferBalance(address payable _to, uint endTime) public payable{
        uint startTime = block.timestamp;
        uint totalSecond = endTime + startTime;

        require(_to != msg.sender, "Can't transfer to ownself");
        require(msg.value <= balance, "Insufficent balance.");
        require(msg.value > 0 , "Amount is zero.");
        require(totalSecond > startTime, "stop time before the start time.");

        uint amount = msg.value;
        uint transferPerSecond = amount/endTime;

        while(startTime <= totalSecond){
            uint timeLeft = totalSecond - block.timestamp;
            if(timeLeft > 0){
                _to.transfer(transferPerSecond);
            }
        }
    }
}
