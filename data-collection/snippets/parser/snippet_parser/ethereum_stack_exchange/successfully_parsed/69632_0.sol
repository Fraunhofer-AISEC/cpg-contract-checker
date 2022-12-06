mapping(address => bool) isMintApprover; 
uint minApprovers = 0;
 address payable headOffice;
 address payable beneficiary;

constructor (address[] memory _approvers, uint _minApprovers, address payable _beneficiary) public payable{
        require(_minApprovers <= _approvers.length, "Should be less than min");
         _minApprovers = minApprovers;
         headOffice = msg.sender;
         _beneficiary = beneficiary;

         for(uint i = 0; i<= _approvers.length; i++){
             address approver = _approvers[i];
             isMintApprover[approver] = true;
         }

        
    }
