pragma solidity 0.5.1;

contract Stages {

    enum Stage { init, two, three, done }

    Stage stage;

    modifier onlyStage (Stage s) {
        require(stage == s, "Wrong step.");
        _;
    }

    function step1() public onlyStage(Stage.init) {
        
        stage = Stage.two;
    }

    function step2() public onlyStage(Stage.two) {
        
        stage = Stage.three;
    }

    function step3() public onlyStage(Stage.three) {
        
        stage = Stage.done;
    }
}
