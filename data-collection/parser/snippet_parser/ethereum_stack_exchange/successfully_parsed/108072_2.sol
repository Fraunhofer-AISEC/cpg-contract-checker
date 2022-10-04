

pragma solidity ^0.8.0;



contract Optim {
    struct Session {
        uint256 raised;
    }

    mapping(uint256 => Session) sessions; 
    
    
    constructor() {        
        sessions[1] = Session(1);
    }

    function direct(uint256 _id) public payable {            
        
        sessions[_id].raised = sessions[_id].raised + 999;        
    }   

    function tmpvar(uint256 _id) public payable {            
        
        Session storage sesh = sessions[_id];
        sesh.raised = sesh.raised + 999;        
    }   
}
