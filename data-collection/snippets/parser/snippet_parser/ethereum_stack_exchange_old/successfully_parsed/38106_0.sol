pragma solidity ^0.4.0;    

contract A {
    C c = new C();

    function A() payable public {}

    function execute(address _bAddress) payable public {
        B b = new B(_bAddress);
        b.execute(address(c));
    }    

    function getFunds() constant public returns (uint) {
        return c.getFunds();
    }
}    

contract B {
    address client;
    address authorizedAgent;

    modifier isClient() {
        if (msg.sender != client) {
            revert();
        }
        _;
    }    

    modifier isAuthorizedAgent() {
        if (msg.sender != authorizedAgent) {
            revert();
        }
        _;
    }    

    modifier isAuthorizedEntity() {
        if (msg.sender != client && msg.sender != authorizedAgent) {
            revert();
        }
        _;
    }    

    function B(address _agent) payable public {
        client = msg.sender;
        authorizedAgent = _agent;
    }    

    function depositFunds() payable public {}    

    function getFunds() isAuthorizedEntity constant public returns (uint) {
        return this.balance;
    }    

    function execute(address _c) isAuthorizedAgent payable public {
        _c.transfer(this.balance);
    }
}    

contract C {
    function C() payable public {}

    function depositFunds() payable public {}    

    function getFunds() constant public returns (uint) {
        return this.balance;
    }
}
