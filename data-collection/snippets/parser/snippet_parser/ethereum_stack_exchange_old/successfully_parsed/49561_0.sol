mapping(address => uint256) public paintingOwnership; 
mapping(uint256 => bool) public sellStatus;

function buy(uint256 paintingID) public {
    require(sellStatus[paintingID],"Painting is not for sale")
    
}

function changeSellStatus(bool value) public {
    require(paintingOwnership[msg.sender] > 0);
    uint paintingID = paintingOwnership[msg.sender];
    sellStatus[paintingId] = value;
}

function availability(uint256 paintingID) public pure returns(bool){
    return sellStatus[paintingId];
}
