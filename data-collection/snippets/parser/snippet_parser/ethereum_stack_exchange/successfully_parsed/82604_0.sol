contract IncentiveContract {

    function claimIncentives(uint256 tokens) public {
        if (condition) {
            MyToken instance = MyToken('address of MyToken');
            instance.transfer('beneficiary address', tokens); 
        }
    }
}
