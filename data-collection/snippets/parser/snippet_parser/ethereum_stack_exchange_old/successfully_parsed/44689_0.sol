pragma solidity ^0.4.0;


contract Taxi {

    enum State {IDLE, FINDING_DRIVER, AWAITING_PAYMENT, AWAITING_DESTINATION, COMPLETE}
    State public currentState;
    mapping (address => uint) public balances;
    bytes32 STRING_COMPLETE = "Complete";
    bytes32 STRING_PARTIAL = "Partial";

    modifier customerOnly() { require(msg.sender == customer); _; }
    modifier driverOnly() { require(msg.sender == driver); _; }
    modifier arbiterOnly() { require(msg.sender == arbiter); _; }
    modifier inState(State expectedState) { require(currentState == expectedState); _; }

    address public customer;
    address public driver;
    address public arbiter;

    function Taxi(address _customer, address _driver, address _arbiter) public {
        customer = _customer;
        driver = _driver;
        arbiter = _arbiter;
    }

    function assignDriver() customerOnly inState(State.IDLE) public {
        
        currentState = State.FINDING_DRIVER;
    }

    function confirmAmount(uint amount) driverOnly inState(State.FINDING_DRIVER) public returns (bool ) {
        if(amount < 0) {
            amount = 20;
        }
        
        if(balances[customer] < amount) {
            return false;
        }
        currentState = State.AWAITING_DESTINATION;
        balances[arbiter] += amount;
        balances[customer] -= amount;
        return true;
    }
}
