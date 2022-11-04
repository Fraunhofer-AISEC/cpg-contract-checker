 function setTokenHolders(address _to)internal returns(bool){
    for(uint i = 0; i<= tokenHolders.length; i++){
        if(_to != tokenHolders[i]){
            tokenHolders.push(_to);
            return true;
        }
        else{
            require(_to == tokenHolders[i],"Redundant token holder addresses.");
        }
    }
}
function getTokenHolders()public view returns(address[] memory){
    return tokenHolders;
}
