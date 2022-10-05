pragma solidity ^0.4.11;

contract owned {
    function owned() { owner = msg.sender; }
    address owner;

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
}


contract mortal is owned {

    function close() onlyOwner {
        selfdestruct(owner);
    }
}

contract priced {

    modifier costs(uint price) {
        if (msg.value >= price) {
            _;
        }
    }
}


contract Register is priced, owned {
    mapping (address => bool) registeredAddresses;
    uint price;

    function Register(uint initialPrice) { price = initialPrice; }

    function register() payable costs(price) {
        registeredAddresses[msg.sender] = true;
    }

    function changePrice(uint _price) onlyOwner {
        price = _price;
    }
}

contract Mutex {
    bool locked;
    modifier noReentrancy() {
        require(!locked);
        locked = true;
        _;
        locked = false;
    }

    function f() noReentrancy returns (uint) {
        require(msg.sender.call());
        return 7;
    }
}
