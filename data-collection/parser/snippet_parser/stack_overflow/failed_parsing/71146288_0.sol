address public owner;
uint256 public balance;

constructor () {
    owner = msg.sender;
    }

receive () payable external {
    balance += msg.value; }


function withdraw (uint amount, address payable destAddr) { public
    require(msg.sender ==owner, "only owner can withrdaw");
    destAddr.transfer(amount);
    balance -= amount;
}
