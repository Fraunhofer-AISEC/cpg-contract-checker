pragma solidity ^0.4.4;
import './Lesson.sol';
import 'foundation/Congress.sol';

contract Lesson_6 is Lesson {
    function Lesson_6(address _dealer, uint _reward)
             Lesson(_dealer, _reward) {}

    function execute(Congress _congress) {
        for(uint i = 0; i < _congress.numProposals(); ++i) {
            if(_congress.proposals[i].proposalPassed) {  
                passed(msg.sender);
                break;
            }
        }
    }
}
