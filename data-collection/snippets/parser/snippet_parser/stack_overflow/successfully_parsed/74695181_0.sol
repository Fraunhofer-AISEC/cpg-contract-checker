interface IDoThings {
    function transfer(address from, address to, uint256 amount) external;
    function setValue(uint256 newVal) external;
    function owner() external view returns (address);
}

contract DoingThings {
    function getOwnerOfAnotherContract(address target) public view returns (address) {
        return IDoThings(target).owner();
    }
}
