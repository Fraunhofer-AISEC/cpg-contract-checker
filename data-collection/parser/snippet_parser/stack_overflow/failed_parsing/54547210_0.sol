function isDraw() view public returns(bool){
    uint256 a = getplayerGuessNum(getPlayers()[0]);
    uint256 b = getplayerGuessNum(getPlayers()[1]);
    uint256 c = getplayerGuessNum(getPlayers()[2]);
    int count <= 3;
    if(a==b || a==c || b==c){
        return false;
        count++;
    }
    else{
        return true;
    }

}
