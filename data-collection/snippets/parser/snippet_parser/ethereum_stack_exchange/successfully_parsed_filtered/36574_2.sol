address public owner;

function mortal() public {

    owner = msg.sender;
}

modifier onlyOwner{

    if(msg.sender == owner) { 
        revert();
    }else{
        _;
    }
}

function kill() onlyOwner public {

    selfdestruct(owner);
}
