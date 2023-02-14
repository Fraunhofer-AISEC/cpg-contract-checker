
function getOnesBalance(address addr) public view returns (uint){
    return addr.balance;
}


function getMyBalance() public view returns (uint){
    return msg.sender.balance;
}


function getMyBalance2() public view returns (uint){
    return msg.value;
}

function getMyBalance3() public view returns (uint){
    return address(this).balance;
}

function deposit(uint _money) public payable {}

function getContractAddr() public view returns (address){
    return msg.sender;
}

function() payable {}
