contract test {
        address myAddress = 0xCBD6832Ebc203e49E2B771897067fce3c58575ac; 
        uint256 balance = myAddress.balance;

        function getBalance() public view returns (uint256) {
            return balance;
        }
}
