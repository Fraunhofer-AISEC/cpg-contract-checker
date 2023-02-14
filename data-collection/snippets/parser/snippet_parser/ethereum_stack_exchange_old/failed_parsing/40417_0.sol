mapping (address => uint) pendingWithdrawals;

function example () private{
    address[] tempList = List;
    for(uint k = 0; k < tempList.length; k++){
            Struct storage val = mapping[tempList[k]];
            pendingWithdrawals[tempList[k]] = (val.value);
    }
}
