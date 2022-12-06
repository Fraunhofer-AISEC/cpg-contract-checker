contract NLTNFT is ERC1155, Ownable {

    uint256[] public tiers;
    uint256 public maxPerWallet;

    constructor() ERC1155('https://nlt.rocks/metadata/{id}.json'){
    tiers = [0, 1, 2];
    maxPerWallet = 3;
    }
}
