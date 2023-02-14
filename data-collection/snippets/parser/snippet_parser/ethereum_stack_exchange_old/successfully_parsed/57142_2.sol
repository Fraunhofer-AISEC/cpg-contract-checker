pragma solidity ^0.4.11;

contract Escrow {
    uint balance;
    address public manager;
    address public worker;
    address private escrow;
    uint private start;
    bool managerOk;
    bool workerOk;

function Escrow(address manager_address, address worker_address) public {
        manager = manager_address;
        worker = worker_address;
        escrow = msg.sender;
        start = now;
    }

    function accept() public {
        if (msg.sender == manager){
            managerOk = true;
        } else if (msg.sender == worker){
            workerOk = true;
        }
        if (managerOk && workerOk){
            payBalance();
        } else if (managerOk && !workerOk && now > start + 30 days) {
            selfdestruct(manager);
        }
    }

    function payBalance() private {
        escrow.transfer(this.balance / 100);
        if (worker.send(this.balance)) {
            balance = 0;
        } else {
            throw;
        }
    }

    function deposit() public payable {
        if (msg.sender == manager) {
            balance += msg.value;
        }
    }

    function cancel() public {
        if (msg.sender == manager){
            managerOk = false;
        } else if (msg.sender == worker){
            workerOk = false;
        }
        if (!managerOk && !workerOk){
            selfdestruct(manager);
        }
    }

    function kill() public constant {
        if (msg.sender == escrow) {
            selfdestruct(manager);
        }
    }
}
