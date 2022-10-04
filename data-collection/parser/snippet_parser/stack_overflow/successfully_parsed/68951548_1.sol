

pragma solidity ^0.8.0;

import "openzeppelin-solidity/contracts/access/Ownable.sol";
import "openzeppelin-solidity/contracts/utils/Strings.sol";
import "openzeppelin-solidity/contracts/token/ERC721/ERC721.sol";
import "./IFactoryERC721.sol";
import "./Creature.sol";



contract CreatureFactory is FactoryERC721, Ownable {
    using Strings for string;

    event Transfer(
        address indexed from,
        address indexed to,
        uint256 indexed tokenId
    );

    address public proxyRegistryAddress;
    address public nftAddress;
    address public lootBoxNftAddress;
    string public baseURI = "https://terrorverso.herokuapp.com/api/token/";

    
    uint256 CREATURE_SUPPLY = 100;

    
    uint256 NUM_OPTIONS = 3;
    uint256 SINGLE_CREATURE_OPTION = 0;
    uint256 MULTIPLE_CREATURE_OPTION = 1;
    uint256 LOOTBOX_OPTION = 2;
    uint256 NUM_CREATURES_IN_MULTIPLE_CREATURE_OPTION = 4;

    constructor(address _proxyRegistryAddress, address _nftAddress) {
        proxyRegistryAddress = _proxyRegistryAddress;
        nftAddress = _nftAddress;


        fireTransferEvents(address(0), owner());
    }

    function name() override external pure returns (string memory) {
        return "Factory";
    }

    function symbol() override external pure returns (string memory) {
        return "FACT";
    }

    function supportsFactoryInterface() override public pure returns (bool) {
        return true;
    }

    function numOptions() override public view returns (uint256) {
        return NUM_OPTIONS;
    }

    function transferOwnership(address newOwner) override public onlyOwner {
        address _prevOwner = owner();
        super.transferOwnership(newOwner);
        fireTransferEvents(_prevOwner, newOwner);
    }

    function fireTransferEvents(address _from, address _to) private {
        for (uint256 i = 0; i < NUM_OPTIONS; i++) {
            emit Transfer(_from, _to, i);
        }
    }

    function mint(uint256 _optionId, address _toAddress, string memory metadataURI)  override public {
        
        ProxyRegistry proxyRegistry = ProxyRegistry(proxyRegistryAddress);
        assert( address(proxyRegistry.proxies(owner())) == _msgSender() || owner() == _msgSender() ||  _msgSender() == lootBoxNftAddress );
        require(canMint(_optionId));

        Creature openSeaCreature = Creature(nftAddress);

        if (_optionId == SINGLE_CREATURE_OPTION) {

            openSeaCreature.mintTo(_toAddress,metadataURI);

        } else if (_optionId == MULTIPLE_CREATURE_OPTION) {
            
            for (
                uint256 i = 0;
                i < NUM_CREATURES_IN_MULTIPLE_CREATURE_OPTION;
                i++
            ) {
                openSeaCreature.mintTo(_toAddress,metadataURI);
            }
        } 
    }

    function canMint(uint256 _optionId) override public view returns (bool) {
        if (_optionId >= NUM_OPTIONS) {
            return false;
        }

        Creature openSeaCreature = Creature(nftAddress);
        uint256 creatureSupply = openSeaCreature.totalSupply();

        uint256 numItemsAllocated = 0;
        if (_optionId == SINGLE_CREATURE_OPTION) {
            numItemsAllocated = 1;
        } else if (_optionId == MULTIPLE_CREATURE_OPTION) {
            numItemsAllocated = NUM_CREATURES_IN_MULTIPLE_CREATURE_OPTION;
        } 
        return creatureSupply < (CREATURE_SUPPLY - numItemsAllocated);
    }

    function tokenURI(uint256 _optionId) override external view returns (string memory) {
        return string(abi.encodePacked(baseURI, Strings.toString(_optionId)));
    }

    
    function transferFrom(
        address _from,
        address _to,
        uint256 _tokenId,
        string  memory metadataURI
    ) public {
        mint(_tokenId, _to, metadataURI);
    }

    
    function isApprovedForAll(address _owner, address _operator)
        public
        view
        returns (bool)
    {
        if (owner() == _owner && _owner == _operator) {
            return true;
        }

        ProxyRegistry proxyRegistry = ProxyRegistry(proxyRegistryAddress);
        if (
            owner() == _owner &&
            address(proxyRegistry.proxies(_owner)) == _operator
        ) {
            return true;
        }

        return false;
    }

    
    function ownerOf(uint256 _tokenId) public view returns (address _owner) {
        return owner();
    }
}
