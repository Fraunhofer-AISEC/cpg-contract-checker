contract MyIfElse {
    uint256 public revealState = 0;
    bool public isNowRevealed = false;

    function addToRevealState () private {
        revealState++;
    }

    function isRevealed () public {
        if (revealState >= 10){
            isNowRevealed = true;
            addToRevealState();
        }else{
            addToRevealState();
        }
    }
}
