pragma solidity 0.5.1;

contract Stages {

    struct Stage {
        uint first;
        uint last;
    }

    Stage[] public stages;

    function appendStage(uint first, uint last) public {
        Stage memory s = Stage({
            first: first,
            last: last
        });
        stages.push(s);
    }

    function isStage(uint i) public view returns(bool) {
        return block.number >= stages[i].first && block.number <= stages[i].last;
    }

    
}
