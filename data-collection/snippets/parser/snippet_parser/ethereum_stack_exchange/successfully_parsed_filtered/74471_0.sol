pragma solidity >=0.4.16 <0.6.0;

contract test {
    enum ActionChoices { GoLeft, GoRight, GoStraight, SitStill }

    function move(uint8 _actionChoice) public {
        require (_actionChoice < ActionChoices.length);
        
    }

}
