contract DaiInterface {

    function approve(address guy, uint wad) public returns (bool);
}



contract DaiTransferrer is Ownable {

    DaiInterface daiContract;

    function approveDai(address guy, uint wad) public {
        daiContract.approve(guy, wad);
    }
}
