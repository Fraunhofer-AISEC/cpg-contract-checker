
pragma solidity ^0.8.0;

contract Receiving {
    uint256 public counter;
    event Received(uint256 amount, uint256 gas);

    receive() external payable {
        uint256 gas = gasleft();
        emit Received(msg.value, gas);
        counter++;
    }

    fallback() external payable {
        uint256 gas = gasleft();
        emit Received(msg.value, gas);
        counter++;
    }

    function receiveFunds() public payable {
        uint256 gas = gasleft();
        emit Received(msg.value, gas);
        counter++;
    }

    function getBalance() public view returns(uint256) {
        return address(this).balance;
    }

}

contract Sending {

    event Sent(uint256 count, uint256 gas);

    
    function sendFundsWithSend(address payable receiving) public payable {
        
        

        emit Sent(1, gasleft());

        bool success = receiving.send(msg.value);
        require(success, "Error with .send");

        emit Sent(2, gasleft());

    }

    
    function sendFundsWithTransfer(address payable receiving) public payable {

         

        emit Sent(1, gasleft());

        receiving.transfer(msg.value);

        emit Sent(2, gasleft());

    }

    
    function sendFundsWithCall(address payable receiving) public payable {

        emit Sent(1, gasleft());

        (bool success, ) = receiving.call{gas: gasleft(), value: msg.value}("");

        require(success, "Error with .call");

        emit Sent(2, gasleft());

    }

    
    function sendFundsToFunction(address payable receiving) public payable {
        emit Sent(1, gasleft());
        Receiving(receiving).receiveFunds{gas: gasleft(), value: msg.value}();
        emit Sent(2, gasleft());
    }

    function getBalance() public view returns(uint256) {
        return address(this).balance;
    }

}
