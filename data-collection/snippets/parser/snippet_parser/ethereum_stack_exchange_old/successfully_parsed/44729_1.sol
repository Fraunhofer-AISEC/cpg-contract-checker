contract TheContract {
    address public mateAddress = OxA

    function () payable public {
        if (msg.sender == mateAddress) {
            
        }
    }

    function checkStatus() {
        if (someCondition) {
            address myAddress = this;
            mateAddress.send(myAddress.balance);
        }
    }
}
