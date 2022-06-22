

pragma solidity >=0.7.0 <0.9.0;

contract Token {
    mapping(address => uint) public userBalances;

    function buy() public payable {
        require(msg.value > 0, "Not enough coins sent");
        userBalances[msg.sender] += msg.value;
    }

    function withdrawBalance() public {
        uint amountToWithdraw = userBalances[msg.sender];
        
        (bool success, ) = msg.sender.call{value: amountToWithdraw}("");
        require(success);
        userBalances[msg.sender] = 0;
    }
}
