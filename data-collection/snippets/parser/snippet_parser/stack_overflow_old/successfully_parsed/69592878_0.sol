contract MyTestContract is ERC721, ERC721Enumerable, Ownable {

bool public preLaunchActive = false;
uint256 public maxGiveAway = 3;

function myPreLaunchGiveAway(uint amount, address to) public onlyOwner {
    require(preLaunchActive, "preLaunchActive state is not active.");
    require(amount <= maxGiveAway, "No more available.");
    require(amount > 0, "Amount must be greater than 0.");
    for (uint i = 0; i < amount; i++) {
        uint256 tokenId = totalSupply();
        if (tokenId < maxGiveAway) {
            _safeMint(to, tokenId);
        }
    }

    maxGiveAway = maxGiveAway.sub(amount);
}

}
