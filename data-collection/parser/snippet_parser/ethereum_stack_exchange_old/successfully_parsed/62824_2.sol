pragma solidity 0.4.25;

contract Refund {

    bool public isRefunding;
    mapping(address => uint) public balances;

    event LogInvestment(address investor); 
    event LogRefundStarted();
    event LogRefundSent(address investor, uint amount);

    function invest() public payable returns(bool success) {
        require(!isRefunding);
        require(msg.value == 0.1 ether);  
        balances[msg.sender] +=  msg.value;
        emit LogInvestment(msg.sender);
        return true;
    }

    

    function setRefunding() public returns(bool success) {
        require(!isRefunding);
        emit LogRefundStarted();
        return true;
    }

    function claimRefund() public returns(bool success) {
        uint amount = balances[msg.sender];
        require(amount > 0);
        balances[msg.sender] = 0;
        emit LogRefundSent(msg.sender, amount);
        return true;
    }

}
