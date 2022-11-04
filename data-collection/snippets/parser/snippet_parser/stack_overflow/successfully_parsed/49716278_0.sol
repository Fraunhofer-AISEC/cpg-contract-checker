function balanceOfTestCoin() returns (uint amount){
    for (uint i = 0; i < funders.length; i++){
        if(funders[i].addr == msg.sender){
            return funders[i].amountTestCoin;
        }
    }
    return 0;
}
