pragma solidity ^0.4.23;

contract Solitaire {
    uint randomNonce = 0;
    uint[] randomNumArray;

    event Deposit(address user, uint256 amout);

    constructor() public payable{
    }

    function GetNonce() public returns (uint) {
        return randomNonce ++;
    }

    function () public payable{
        uint value = GetNonce() + 20;
        emit Deposit(msg.sender, value);

    }
}

contract CallTest {
    event logSendEvent(address to, uint256 value);
    event depositvalue(address sender, uint256 value);



    function transferEther(address towho) public payable {
        require(address(this).balance > 100000000000000000, "Contract address does not exist enough money.");
        towho.transfer(100000000000000000);
        emit logSendEvent(towho, 100000000000000000);
    }

    function deposit() public payable {
        emit depositvalue(msg.sender, msg.value);
    }

    function GetBalance() public view returns(uint256) {
        return address(this).balance;
    }

    constructor() public payable{
    }
}
