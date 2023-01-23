pragma solidity 0.8.4;

contract ContractC1 {

    uint256 counter;
    uint256 balanceOfContract = 0;
    mapping (uint256 => User) public users;

    struct User { 
        address participantsAddress;
        uint256 participantETHamount;
    }

    function invest() external payable {
        balanceOfContract = balanceOfContract + msg.value;
        User memory user = User(msg.sender, msg.value);
        users[counter] = user;
        counter++;
    }
}
