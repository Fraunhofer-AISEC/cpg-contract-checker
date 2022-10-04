uint256[] public geneses;

function createGenesTest(uint256 _genes, address _owner) public returns(uint256 id) {
    id = geneses.push(_genes);
    dragonIndexToOwner[id] = _owner;
}

function getGenesTest(uint256 _id) public constant returns(address) {
    return dragonIndexToOwner[_id];
}

function getGenesNum() public constant returns(uint256){
    return 1000;
    
}
