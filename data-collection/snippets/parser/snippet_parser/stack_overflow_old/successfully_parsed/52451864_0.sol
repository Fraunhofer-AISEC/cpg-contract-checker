struct Division {
    address owner;
    uint256 plots;
}

mapping(bytes32 => Division[]) Properties;    

function addDivision(bytes32 _property, address _owner, uint256 _plots) 
   public returns (bool success) {


    Division memory currentEntry;

    currentEntry.owner = _owner;
    currentEntry.plots = _plots;


    Properties[_property].push(currentEntry);

    return true;
}


function getPlot(bytes32 _property, address _owner) public view returns (uint) {


    for(uint i = 0; i < Properties[_property].length;  i++) {
        if(Properties[_property][i].owner == _owner)
          return Properties[_property][i].plots;
        }
    return 9999;
}
