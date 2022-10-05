contract SpeadTheGainContract{
    uint public _totalSupply;
    mapping(address => uint) public balances;
    uint public indexedAddressesCounter = 0;
    mapping(address=>bool) ifAdressExisted;
    mapping(uint=>address) ownersAddresses;
    uint requiredAmount = 1 wei;
    
    function spreadTheGain() external{
        for (uint i = 0; i < indexedAddressesCounter; i++){
            payable(ownersAddresses[i]).transfer(address(this).balance*(balances[ownersAddresses[i]]/_totalSupply));
        }
    }
    
    function increaseValue() external payable{
        require(msg.value >= requiredAmount, "Can't send 0 value!");
    }
}
