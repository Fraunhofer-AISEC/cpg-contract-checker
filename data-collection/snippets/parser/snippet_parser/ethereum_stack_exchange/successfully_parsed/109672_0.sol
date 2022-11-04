Ships.TokenHarvest[][] public nameToCost;

function addNameToCost(Ships.TokenHarvest[][] memory costs) public onlyOwner {
    nameToCost = costs;
}
