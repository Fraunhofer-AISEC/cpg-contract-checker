  contract DummyContract {
    event LogSent(bytes32 data);
    function sendData(address otherContractAddress, bytes32 data) public {
        
        if (someCondition) {
            someFunction();
        }

    emit LogSent(data);
    
    otherContractAddress.call(data);

    
    Oracle.sendData(data);
}


}
