contract  Holders{

uint _totalHolders; 
mapping (uint=> address ) private holders;
mapping (address => uint) private shares;

function GetShares(uint shares) public {
    ... 
    holders[_totalHolders] = msg.sender;
    shares[msg.sender] = shares; 
    _totalHolders++;
    ...
} 

function PayOut() public {
    ...
    uint shares;
    for(uint i = 0 ; i<_totalHolders; i++) {
        shares = shares[holders[i]];
        ...
    }
    ... 
} 
