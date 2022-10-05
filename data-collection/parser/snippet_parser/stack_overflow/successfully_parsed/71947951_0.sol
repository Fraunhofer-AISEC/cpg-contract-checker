
pragma solidity 0.8;

contract Ownable {
    mapping (address => bool) private whiteListed;
    modifier onlyWhiteListed {
        require(whiteListed[msg.sender] == true, "You're not whitelisted");
        _;
    }

    constructor () {
        whiteListed[msg.sender] = true;
    }

    function setWhiteListed(address addr, bool trueOrFalse) public onlyWhiteListed {
        whiteListed[addr] = trueOrFalse;
    }

    function getWhiteListed(address addr) public view returns (bool) {
        return whiteListed[addr];
    }
}

contract A is Ownable {
    B public b;
    event LogMsgSender(address who);

    constructor() {
        b = new B(address(this));
        
        setWhiteListed(address(b),true);
    }

    function callMe() public onlyWhiteListed {  
        emit LogMsgSender(msg.sender);          
    }

    function callSender(address sender) public onlyWhiteListed {    
        emit LogMsgSender(sender);                                  
    }                                                               
}

contract B is Ownable {
    A public a;

    constructor(address addr) {   
        a = A(addr);              
    }                             

    function callMe() public onlyWhiteListed {  
        a.callMe();                             
    }

    function callSender() public onlyWhiteListed {  
        a.callSender(msg.sender);                   
    }                                               
                                                    
}

contract C {
    B public b;

    constructor(address addr) {
        b = B(addr);
    }

    function callMe() public {  
        b.callMe();             
    }                           

    function callSender() public {
        b.callSender();
    }
}
