contract MyContract {
    mapping(address => uint256) balances;

    function getOnesBalance(address addr) public view returns (uint){
        return balances[addr];
    }
    function getMyBalance() public view returns (uint){
        return balances[msg.sender];
    }
    function getContractBalance() public view returns (uint){
        return address(this).balance;
    }
    function getContractAddress() public view returns (address){
        return address(this)
    }
    function deposit() public payable {balances[msg.sender]+=msg.value;}
    function() public payable {deposit();}
}
