pragma solidity >= 0.8.0 < 0.9.0;

contract ContractA {


    uint public boughtItems = 0;
    uint price = 10;
    address []  buyers; 

    function buySomething() public payable {
        require(msg.value >= price, "Sent value is lower"); 
        boughtItems++;
        buyers.push(msg.sender);
    }
}
