event LogAddress(address _address);
    
Storage stg;
constructor() {
    stg = new Storage();
    emit LogAddress(address(stg));
}
