
pragma solidity ^0.8.3;

contract Test {
    enum Stages {
        stage_01,
        stage_02,
        stage_03,
        stage_04,
        stage_05
    }

    Stages public stage = Stages.stage_01;

    function setStage(Stages _stage) public {
        stage = _stage;
    }
}
