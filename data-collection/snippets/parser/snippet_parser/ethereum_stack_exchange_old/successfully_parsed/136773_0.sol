
pragma solidity 0.8.7;

contract Protocol {
    mapping(address => uint256) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() public payable {
        require(balances[msg.sender] > 0, "BRUH");
        (bool success, ) = (msg.sender).call{value: 1 ether}("");
        require(success);
        balances[msg.sender] = 0;
    }

    function getBalance() public view returns(uint256) {
        return address(this).balance;
    }
}
