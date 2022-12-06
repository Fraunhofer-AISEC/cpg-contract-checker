
pragma solidity ^0.8.12;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract FutNFT is ERC721, ERC721Enumerable, Ownable {
    
    struct Player {
        string name;
        string preferredPosition;
        uint256 id;
        uint8 age;
        uint8 level;
        uint64 lastUpgrade;
        string[] suitablePositions;
        string imageURI;
    }

    struct History {
        uint256 winCount;
        uint256 lossCount;
    }

    mapping(address => History) ownerHistory;
    mapping(uint256 => Player) players;
    mapping(uint256 => address) public playerToOwner;
    mapping(uint256 => uint256) listedPlayerIndex;
    uint256[] public listedPlayers;
    uint256[] playerIds;

    event PlayerAdded(uint256 playerId);

    modifier owned(uint256 id) {
        require(getPlayerExists(id), "Player does not exist");
        require(msg.sender == ownerOf(id), "Not the owner!");
        _;
    }

    constructor() ERC721("FutNFT", "FNFT") {}

    function getListedPlayers() public view returns (uint256[] memory) {
        return listedPlayers;
    }

    function getPlayer(uint256 _id) public view returns (Player memory) {
        return players[_id];
    }

    function getPlayersByOwner(address _owner)
        public
        view
        returns (uint256[] memory)
    {
        uint256[] memory result;
        uint256 index = 0;
        for (uint256 i = 0; i < playerIds.length; i++) {
            if (playerToOwner[playerIds[i]] == _owner) {
                result[index] = playerIds[i];
                index++;
            }
        }
        return result;
    }

    function ownerOf(uint256 tokenId)
        public
        view
        override(ERC721, IERC721)
        returns (address)
    {
        return super.ownerOf(tokenId);
    }

    function getPlayerExists(uint256 _id) public view returns (bool) {
        return playerToOwner[_id] != address(0);
    }

    function mint(Player memory _player) public onlyOwner {
        require(playerToOwner[_player.id] == address(0), "Player Exists!");
        players[_player.id] = _player;
        playerIds.push(_player.id);
        playerToOwner[_player.id] = msg.sender;
        _mint(msg.sender, _player.id);
        emit PlayerAdded(_player.id);
    }

    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 tokenId
    ) internal override(ERC721, ERC721Enumerable) {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
