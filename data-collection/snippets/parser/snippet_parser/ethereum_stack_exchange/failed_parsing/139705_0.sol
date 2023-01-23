Function getTradingEnableStatus() external view returns (bool){
   
    Return lockused;
}

Function starttrading () external only owner {
    require(lockused == false);
    lockTilstart = false ;
    locktime = launchtime.add(Lockdiff);
    emit locktilstartupdate(locktilstart);
    emitTradeStarted(true):
}
