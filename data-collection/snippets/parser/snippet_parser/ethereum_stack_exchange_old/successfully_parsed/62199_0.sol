pragma solidity 0.4.25;

contract Factory {

    address[] public volatileContracts;
    event LogCreatedVolatileContract(address sender, address volatileContract);
    event LogKilledVolatileContract(address sender, address volatileContract);

    

    function createVolatileContracts() public returns(bool success) {
        require(volatileContracts.length==0, "Ten at a time, please.");
        for(uint i=0; i<10; i++) {
            Volatile v = new Volatile();
            volatileContracts.push(address(v));
            emit LogCreatedVolatileContract(msg.sender, address(v));
        }
        return true;
    }

    function destroyVolatileContracts() public returns(bool success) {
        for(uint i=0; i<10; i++) {
            emit LogKilledVolatileContract(msg.sender, volatileContracts[i]);
            Volatile v = Volatile(volatileContracts[i]);
            v.kill();
        }
        volatileContracts.length=0;
        return true;
    }

}

contract Volatile {

    address public owner;

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    event LogSelfDestruction(address sender, address this, address owner, uint balance);

    constructor() public {
        owner = msg.sender;
    }

    function kill() public onlyOwner {
        emit LogSelfDestruction(msg.sender, address(this), owner, address(this).balance);
        selfdestruct(owner);
    }
}
