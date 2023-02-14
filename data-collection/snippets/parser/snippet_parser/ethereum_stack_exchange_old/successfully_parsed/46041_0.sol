pragma solidity ^0.4.8;

contract Rental {
    struct PaidRent {
        uint id;
        uint value;
    }
    PaidRent[] public paidrents;
    event RentPaid(bool Status);
    uint public createdTimestamp;
    uint public rent;
    uint public security_deposit;
    string public house;
    address public owner;
    address public tenant;

    enum State {Created, Started, Terminated}
    State public state;
    function Rental(uint _rent, uint _security_deposit, string _house, address _owner, address _tenant) {
        createdTimestamp = block.timestamp;
        rent = _rent;
        security_deposit = _security_deposit;
        house = _house;
        owner = _owner;
        tenant = _tenant;
    }
    modifier require(bool _condition) {
        if(!_condition) throw;
        _;
    }
    modifier ownerOnly() {
        if(msg.sender != owner) throw;
        _;
    }
    modifier TenantOnly() {
        if(msg.sender != tenant) throw;
        _;
    }
    modifier inState(State _state){
        if(_state != state) throw;
        _;
    }

    function getPaidRents() internal returns (PaidRent[]) {
        return paidrents;
    }

      function getHouse() constant returns (string) {
        return house;
    }
    function getowner() constant returns (address) {
        return owner;
    }
    function getTenant() constant returns (address) {
        return tenant;
    }
    function getRent() constant returns (uint) {
        return rent;
    }
    function getDeposit() constant returns (uint) {
        return security_deposit;
    }
    function getContractCreated() constant returns (uint) {
        return createdTimestamp;
    }
    function getContractAddress() constant returns (address) {
        return this;
    }
    function getState() returns (State) {
        return state;
    }
    function CollectEth() payable  {}

    function payRent(uint _rent) public payable returns(bool status) {
        if(owner.send(_rent)){
          RentPaid(true);
          return true;
        } else {
          return false;
        }
    }

    function terminateContract(address deposit_to) inState(State.Started) require(this.balance == security_deposit) {
        deposit_to.transfer(security_deposit);
        state = State.Terminated;
    }



}
