interface IMyToken {
    function mint() {} external payable;
}

contract Mock {
    IMyToken public myToken;

    constructor(address payable myTokenAddress) payable {
        myToken = IMyToken(myTokenAddress);
    }

    function mint() public payable {
        myToken.mint();
    }
}
