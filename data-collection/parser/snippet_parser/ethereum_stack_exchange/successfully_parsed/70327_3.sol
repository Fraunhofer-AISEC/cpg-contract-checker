contract send_ether{
    mapping(address => uint256) public balances;

    function depositFunds() public payable {
        balances[msg.sender] += msg.value;
        }

    function close() public {
        selfdestruct(0x692a70d2e424a56d2c6c27aa97d1a86395877b3a);
    }
}
