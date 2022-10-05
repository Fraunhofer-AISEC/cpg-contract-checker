    pragma solidity >=0.8.13;

    contract MyContract {
    
    
    
    constructor() {
            
        }
    
    address[] public myParticipants;
    
     function someFunction() public {
     myParticipants.push(msg.sender);
    
    }
}
