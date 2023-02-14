import "@openzeppelin/contracts/access/Ownable.sol";



contract RoleManager is Ownable {

    mapping(bytes32 => function(bytes32, address, address[] memory, uint256[] memory, bytes[] memory, string memory) external view returns (bool)) public rules;

    
    function setRule(bytes32 role, function(bytes32, address, address[] memory, uint256[] memory, bytes[] memory, string memory) external view returns (bool) rule) public onlyOwner {
        rules[role] = rule;
    }

   
}
