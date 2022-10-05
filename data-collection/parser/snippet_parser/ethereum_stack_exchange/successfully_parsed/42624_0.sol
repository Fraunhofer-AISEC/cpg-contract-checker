pragma solidity ^0.4.0;
contract SEexample {

    int256[3] thing;
    uint8 internal i=0;

    function submit(int256[3] bids,int256[3] prefs) public returns (int256[3]){
            for (i=0;i<3;i++){
                thing[i] = bids[i] + prefs[i];
            }
        return thing;
    }
}
