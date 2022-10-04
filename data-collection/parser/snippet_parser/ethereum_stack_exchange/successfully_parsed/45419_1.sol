contract TestEmojiCoin {
    uint public initialBalance = 1 ether;

    function testPurchase() public {
        address contractAddress = DeployedAddresses.EmojiCoin();
        EmojiCoin emojiCoin = EmojiCoin(contractAddress);

        

        emojiCoin.purchase.value(1 ether).gas(30000000000)(0);      
    }
}
