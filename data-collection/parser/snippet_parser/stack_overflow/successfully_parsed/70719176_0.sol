contract MyTransfer{
    address owner;
    uint data;
    uint private amount;
    string greeting = "Hello World";
    constructor() public {
        owner = msg.sender;
    }
    function greet () constant public returns (string){
        return greeting;
    }
    function deposit() public payable {
        amount += msg.value;
    }
    function withdraw() public {
        msg.sender.transfer(amount);
    }
    function kill () public {
        require(owner == msg.sender);
        selfdestruct(owner);
    }
}
