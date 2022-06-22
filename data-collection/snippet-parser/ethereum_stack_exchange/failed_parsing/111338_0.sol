struct Job{
        address host;
        mapping(address=>bool) isReceiver;
        uint256 amount;
        uint256 maximumProviders;
        uint256 expiration;
        uint256 total_receivers;
    }

function deposit(uint256 _amount) public returns (bool) {
        _balances[msg.sender]=_balances[msg.sender].add(_amount);
        require(_token.transferFrom(msg.sender,address(this),_amount));
        emit Deposit(msg.sender,_amount);
        return true;
    }


function createJob(uint256 amount,uint256 maximumProviders,uint256 expiration) external returns(bool){

' some operation
' some operation

 job.amount=amount;
_balances[msg.sender]=_balances[msg.sender].sub(amount);
}


function redeem(uint256 jobId,uint256 amount,bytes calldata signature){

 require(job.isReceiver[msg.sender],"not receiver");



'some other operation
'some other operation

}


 function addReceivers(uint256 jobId,address[] calldata receivers) onlyOwner(msg.sender){



emit(receivers);

}

