address public owner;

function Ownable() public {
   owner = msg.sender; 

}

modifier onlyOwner {
    require(owner == msg.sender); 
    _;
}
