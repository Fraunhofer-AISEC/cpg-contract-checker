contract VendingMachine {

event Unlocked(address machineID, address unlocker);
event MachinePayed(address machineID, uint amount);
event CustomerPayed(address customer, uint amount);

address admin;

struct Machine {
    bool exists;
    bool isFunded;
    address owner;
    address currentBuyer;
    uint minFunding;
    uint escrowBalance;
}

mapping(address => Machine) public machines;

modifier onlyMachines() {
    if (machines[msg.sender].exists)
    _
}

modifier onlyAdmin() {
    if (msg.sender==admin)
    _
}

function () { throw; }

function VendingMachine() {

    admin=msg.sender;
}

function fundMachine(address _machineID) {
    if (msg.value < machines[_machineID].minFunding)
    throw;
    machines[_machineID].currentBuyer=msg.sender;
    machines[_machineID].isFunded = true;
    machines[_machineID].escrowBalance = msg.value;
    Unlocked(_machineID, msg.sender);
}

function executePayment(uint _price) onlyMachines {
    machines[msg.sender].escrowBalance -= _price;
    machines[msg.sender].currentBuyer.call.value(machines[msg.sender].escrowBalance)();
    CustomerPayed(machines[msg.sender].currentBuyer, machines[msg.sender].escrowBalance);
    msg.sender.call.value(_price)();
    MachinePayed(msg.sender, _price);

    
    machines[msg.sender].escrowBalance = 0;
    machines[msg.sender].isFunded = false;

}

function registerMachine(address _machineID, address _owner, uint _minFunding) onlyAdmin {
    machines[_machineID].exists = true;
    machines[_machineID].owner = _owner;
    machines[_machineID].minFunding = _minFunding;
}

function checkAdmin() returns (address){
return admin;
}
}
