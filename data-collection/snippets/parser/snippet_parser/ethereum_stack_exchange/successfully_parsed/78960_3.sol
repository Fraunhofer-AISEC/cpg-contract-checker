pragma solidity ^0.5.0;

contract LandRegistry {
    
    struct landDetails{ 
        string state; 
    }

    landDetails public land;

    constructor( 
        string memory _state 
    )public {         
        land.state = _state;
    }
}
