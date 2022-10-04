contract TestNFT is ERC721, Ownable {
    struct Child {
        string name;
    }

    struct Father {
        string name;
        Child[] childs;
    }

    mapping(uint256 => Child) private _childs;
    uint256 nextChild = 0;

    mapping(uint256 => Father) private _fathers;
    uint256 nextFather = 0;

    constructor(string memory name, string memory symbol)
        ERC721(name, symbol)
    {}

    function mint(
        string memory name
    ) public onlyOwner {
        _safeMint(msg.sender, nextCharacter);
        _childs[nextChild] = Child(name);
        nextChild++;
    }

    function mintFather(string memory name) public onlyOwner {
        _safeMint(msg.sender, nextClan);
        _fathers[nextFather] = Father(name, new Child[](0));
        nextFather++;
    }

    function insertChildToFather(uint256 fatherId, uint256 childId)
        public
        onlyOwner
    {
        Child memory child = _childs[childId];
        _fathers[fatherId].childs.push(child);
    }
}
