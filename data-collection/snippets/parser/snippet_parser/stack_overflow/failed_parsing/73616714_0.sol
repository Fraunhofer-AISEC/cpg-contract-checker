uint256 public  intialSuply= 1000;
address public wallet= 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
address public  owner;
mapping (address=>uint) public  balances;

constructor(){
    owner=msg.sender;
     balances[wallet]=1000;
}

modifier onlyOwner(){
    
    require(owner==msg.sender);
    _;
}


function locker()public {

}
