interface ILib {
    function customSend(uint256 value, address receiver) external returns (bool);
}

Contract testToken{

    customLibAddr = 

    ILib lib;    

    constructor(uint256 price) { 
        owner = msg.sender;
        tokenPrice = price; 
        lib = IcustomLib(customLibAddr);
    }

    function sellToken(uint256 numTokens) public payable returns(bool){
        require(numTokens <= bank[msg.sender],"not enough");
        bank[msg.sender] -= amount;
        uint256 money = numTokens*tokenPrice;
        bool outcome = lib.customSend(money,(msg.sender));
     }

}

