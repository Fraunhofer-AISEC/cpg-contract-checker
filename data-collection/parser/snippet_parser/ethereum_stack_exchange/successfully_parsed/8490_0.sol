contract MyContract {
    uint public len;
    mapping(uint=>byte) public names;
    function initContracts(byte[] contractNames_){
        for(uint i=0;i<contractNames_.length;i++){
            names[i]=contractNames_[i];
        }
        len=contractNames_.length;
    }
}
