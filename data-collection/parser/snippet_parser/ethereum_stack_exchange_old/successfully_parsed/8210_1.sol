contract otherContract {
    myContract mc;
    function otherContract (address _mc) {
        mc = myContract(_mc);
    }
    function getMyMapItem (uint key) constant returns (uint, address) {
        return mc.myMap(key);
    }
}
