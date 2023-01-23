contract MortalS {
    
    address payable public owner;

    constructor() public { owner = msg.sender; }

    function kill() payable public { if (msg.sender == owner) selfdestruct(owner); }
    function() external payable{}
    
}
