mapping (address => mapping (address => uint[])) public allowed;

function approve (address _to, uint256 tokenId) external {
   allowed [msg.sender][_to].push(tokenId);
}
