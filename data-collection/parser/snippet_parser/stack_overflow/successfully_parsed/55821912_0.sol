contract MyContract {
    mapping(address=>bool) public registerUsers;
    address owner;

    modifier onlyOwner(){
        require(msg.sender==owner);
        _;
    }
    modifier onlyUser(){
        require(registerUsers[msg.sender] == true);
        _;
    }

    function() external payable { }
    constructor() public{
        owner = msg.sender;
    }

    function  addUser(address userAddr) onlyOwner() public{
        registerUsers[userAddr] = true;
    }
    
    function claimEth(uint amount) onlyUser() public{
        msg.sender.transfer(amount);
    }
}
