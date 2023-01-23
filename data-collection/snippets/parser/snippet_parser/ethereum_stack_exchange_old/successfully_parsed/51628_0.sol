function setLoanStatus(address _loan, bytes1 _newStatus) public {
    
    var check = (_newStatus == 0x41 || _newStatus == 0x49 || _newStatus == 0x53);
    if (check)
        {
        
        loanStatusList[_loan] = _newStatus;
        } 

} 
