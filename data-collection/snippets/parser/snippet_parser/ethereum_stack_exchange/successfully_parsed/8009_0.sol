contract C {
    event myEvent(bool x, address y);
    address someAddress;

    function someAddressExist(){
        if(someAddress != 0){
            myEvent(true, someAddress);
        }
    }    

    function setSomeAddress(address y){
        someAddress = y;
    }
}
