pragma solidity ^0.4.8;

contract Rental {
    struct PaidRent {
        unit id;
        unit value;
    }
    PaidRent[] public paidrents;

    unit public createdTimestamp;
    unit public rent;
    unit public security_deposit;
    string public house;
    address public owner;
    address public tenant;

    enum state {Created, Started, Terminated}
    State public state;
    function Rental(unit _rent, unit _security_deposit, string _house, address _owner, address _tenant) {
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
    modifier LandlordOnly() {
        if(msg.sender != landlord) throw;
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

    function getHouse() constant returns (String) {
        return house;
    }
    function getLandlord() constant returns (address) {
        return landlord;
    }
    function getTenant() constant returns (address) {
        return tenant;
    }
    function getRent() constant returns (unit) {
        return rent;
    }
    function getDeposit() constant returns (unit) {
        return security_deposit;
    }
    function getContractCreated() constant returns (unit) {
        return createdTimestamp;
    }
    function getContractAddress() constant returns (address) {
        return this;
    }
    function getState() returns (State) {
        return state;
    }
    function CollectEth() payable  {}

    function payRent() TenantOnly inState(State.started) require(msg.value == rent) {
        landlord.transfer(msg.value);
        paidrents.push(PaidRent({
            id : paidrents.length + 1,
            value : msg.value
        }));
    }

    function terminateContract(address deposit_to) inState(State.started) require(this.balance == security_deposit) {
        deposit_to.transfer(security_deposit);
        state = State.Terminated;
    }



}
