string company_name;
function getComp(string memory arr) public returns (string memory) 
{
    company_name=concate(arr);
}

function concate(string memory arr) internal view returns(string memory)
{
    return string(abi.encodePacked(company_name," ",arr));
}

function ShowComp() public view returns (string memory)
{
    return company_name;
}
