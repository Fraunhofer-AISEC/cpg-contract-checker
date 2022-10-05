contract PhoneBook {
    modifier onlyMasterAccess() {
        require(msg.sender == master);
        _;
    }
}


contract Customer is PhoneBook{
    function initCustomerContract() onlyMasterAccess {    
        state = true;
  }
}
