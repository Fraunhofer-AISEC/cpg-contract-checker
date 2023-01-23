contract DustContract is ERC721Enumerable, ReentrancyGuard, Ownable {

    using Counters for Counters.Counter;
    using Strings for uint256;
    uint256 public constant maxFux = 100;
    bool public contractIsActive;
    Counters.Counter private _tokenIds;
    mapping (uint256 => string) private _tokenURIs;
    
    struct Funds {
        uint amount;
        address sender;
        uint time;
    }

    struct TraitData {
        uint256 id;
        string name;
        string svg;
    }

    struct Trait {
        TraitData[] common;
        TraitData[] uncommon;
        TraitData[] rare;
        TraitData[] epic;
        TraitData[] legendary;
    }
    
        struct Traits {
            Trait[] eyes;
            Trait[] body;
            Trait[] head;
        }
        
   Traits internal traits;
   Trait internal trait;
    TraitData internal traitData;
    
    function createTrait(
        uint256 _rarity,
        uint256 _traitType,
        uint256 _id,
        string calldata _name,
        string calldata _svg
        
    )
    external onlyOwner contractActive 
    {

        require(_traitType > 0);
        require(_rarity > 0);
        require(_id > 0);
        require(bytes(_name).length > 0);
        require(bytes(_svg).length > 0);

        trait.common.push(traits.eyes.push(TraitData(_id, _name, _svg)));

    }
}