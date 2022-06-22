contract FundTrans {    
    address owner;    
    constructor () public {
        owner = msg.sender;
    }    
    mapping (address => uint256) balances;    
    function () payable private {
       owner.transfer(msg.value);
    }    
}
