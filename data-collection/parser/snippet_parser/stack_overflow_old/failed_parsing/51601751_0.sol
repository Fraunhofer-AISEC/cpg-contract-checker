enum Stages {
    AcceptingEntryFees,
    RevealQuestion,
    Complete
}

modifier transitionToReveal(uint _playerCount) {
    _;
    if (stage == Stages.AcceptingEntryFees && now >= creationTime + 30 seconds && _playerCount > 0) {
        nextStage();
    }
}

modifier transitionToComplete() {
    _;
    if (stage == Stages.RevealQuestion && now >= creationTime + 60 seconds) {
        nextStage();
    }
}

modifier transitionToAcceptingFees() {
    _;
    if (stage == Stages.Complete && now >= creationTime + 90 seconds) {
        nextStage();
    }
}

function nextStage() internal {
    stage = Stages(uint(stage) + 1);
}
