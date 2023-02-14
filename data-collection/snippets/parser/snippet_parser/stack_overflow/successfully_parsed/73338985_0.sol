constructor( string memory _secret)public{
    owner = msg.sender;
}

modifier addcontract(string memory _secret){
    require(owner == msg.sender, "only owner can accesss");
    _;

}
