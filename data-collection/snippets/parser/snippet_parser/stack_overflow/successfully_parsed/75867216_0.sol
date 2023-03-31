
pragma solidity ^0.8.17;

contract EntryPoint {
    Wallet _wallet;

    event Received(address caller, uint amount, string message);
    event data(bytes data);
    event log(address receiver, uint value);
    event Deployed(address addr, uint salt);

    
    
    

    receive() external payable {
        emit Received(msg.sender, msg.value, "Fallback was called");
    }

    function fundWallet(address payable _addr, uint amount) public payable {
        (bool success,) = _addr.call{value:amount}("");
        require(success, "failed to fund wallet");
    }

    function executeOp(address wallet_, address payable to, uint amount) public returns(bool) {
        
        (bool success, ) = wallet_.call(abi.encodeWithSignature("transferEth(address, uint)", to, amount));
        require(success, "failed to execute operation");
        emit log(to, amount);
        return true;
    }
}

contract Wallet {

    address _entrypoint;

    receive() external payable {}

    constructor(address entrypoint_){
        _entrypoint = entrypoint_;
    }

    function entrypoint() public view returns(address){
        return _entrypoint;
    }

    function transferEth(
        address payable to,
        uint amount
    ) public payable returns (address, uint) {
        require(msg.sender == entrypoint(), "this function only call by entrypoint");
        require(address(this).balance >= (amount/1 ether), "wallet doesn't have enough balance");
        (bool sent, ) = to.call{value: amount}("");
        require(sent, "failed to send");
        return (to, amount);
    }

    function getBalancse() public view returns(uint) {
        return address(this).balance;
    }

    function getBalanceOf(address acc) public view returns (uint) {
        return address(acc).balance;
    }
}
