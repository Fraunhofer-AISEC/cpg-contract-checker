pragma solidity ^0.4.18;

contract metaCoin {
    mapping (address => uint) public balances;
    address[] public addresses;

    function metaCoin() {
        balances[msg.sender] = 10000;
        addresses.push( msg.sender );
    }
    function getBalance(address _addr) public view returns (uint) {
        return balances[_addr];
    }
    function sendToken(address receiver, uint amount) returns(bool successful, address _caller){
        if (balances[msg.sender] < amount) return (false, msg.sender);
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        addresses.push( receiver );
        return (false, msg.sender);
    }
}

contract coinCaller{

    function sendCoin(address coinContractAddress, address receiver, uint amount) public returns (address) {
        metaCoin m = metaCoin(coinContractAddress);
        var (status, addr) = m.sendToken(receiver, amount);
        return addr;
    }
}
