pragma solidity 0.5.0+;
contract Survey {
    
     event SurveyInitialized(address indexed owner, uint indexed surveyReward);

    
    address public owner;
    address private factory;

    Constructor Survey(address _owner) payable public {
        (_owner != address(0));
        (msg.value > 0);
        owner = _owner;
        factory = msg.sender;
        emit SurveyInitialized(owner, msg.value);
    }
}
