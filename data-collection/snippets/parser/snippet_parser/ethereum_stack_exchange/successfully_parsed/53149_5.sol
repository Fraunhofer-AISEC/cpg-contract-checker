address myContract;
function mint(address _owner, uint256 _id) external
{
    require(msg.sender == owner || msg.sender == myContract);
    super._mint(_owner, _id);
}
