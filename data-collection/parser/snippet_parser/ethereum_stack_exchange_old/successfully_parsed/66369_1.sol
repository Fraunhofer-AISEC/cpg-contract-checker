contract B {    
    struct  Player {
        uint id;   
    }
    mapping (uint=> Player) public Players; 
 }

contract A is B {
    constructor() public {
        B.Player storage p = B.Players[1];   
    }
 }
