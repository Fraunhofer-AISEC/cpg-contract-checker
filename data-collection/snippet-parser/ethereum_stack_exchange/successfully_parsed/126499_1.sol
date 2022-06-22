
pragma solidity ^0.8.0;

contract Distribution {
    constructor() payable {}

    function sendValue(address payable recipient, uint256 amount) internal {
        require(
            address(this).balance >= amount,
            "Address: insufficient balance"
        );

        (bool success, ) = recipient.call{value: amount}("");
        require(
            success,
            "Address: unable to send value, recipient may have reverted"
        );
    }

    function withdrawFunds() external {    
        address receiptWallet = 0xA0186C212E51Fb0fBc236aD9679A45B295Bd2ADB; 
        address myWallet = 0x06248eC763aA1AAC3e02ff82E474364770Ef3764; 

        address payable wallet1 = payable(receiptWallet); 
        address payable wallet2 = payable(myWallet);

        uint256 _95 = (address(this).balance * 95) / 100; 
        uint256 _5 = (address(this).balance * 5) / 100; 

        sendValue(wallet1, _95);
        sendValue(wallet2, _5);
    }

    function receiveFunds() external payable {
        this.withdrawFunds();
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
