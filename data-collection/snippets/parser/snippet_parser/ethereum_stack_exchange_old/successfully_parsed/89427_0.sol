 function() external payable {
    
    if (msg.sender == bank_owner) {
        emit AdminDeposit(msg.value, bank_owner);
        
    } else {
        address _referrer = bytesToAddress(msg.data);
        _init(msg.sender, msg.value, _referrer);
    }
}

function _init(address payable _investor, uint256 _investValue, address _referrer) private {
    bool doInvest = true;
    if (_investValue == PLAN_PRICE[0]) {
        planid = 1101;
    }
    else if (_investValue == PLAN_PRICE[1]) {
        planid = 1102;
    }
    else if (_investValue == PLAN_PRICE[2]) {
        planid = 1103;
    }
    else if (_investValue == PLAN_PRICE[3]) {
        planid = 1104;
    } 
    else{
        doInvest = false;
        emit TestEvent(planid);
    }

    if (doInvest == true){
        invest(_investValue, _investor, planid, _referrer);
    }else
    {
        revert("Incorrect value sent!");
    }
}
