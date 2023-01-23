 mapping(uint => bytes32) public votingToRoot;
    mapping(uint => bytes32[]) public votingToLeaves;
    mapping(address => History[]) public voterHistory;

    function addLeaf(uint _votingId, bytes32 _leaf, bytes32 _newRoot) external {
        bytes32 defaultValue = 0xcfee7c08a98f4b565d124c7e4e28acc52e1bc780e3887db0a02a7d2d5bc66728;
        bool result = checkLeaf(_votingId, _leaf);
        require(result, "The same leaf already added to the tree");
        votingToLeaves[_votingId].push(_leaf);
        votingToLeaves[_votingId].push(defaultValue);
        setRoot(_votingId, _newRoot);
    }

    function setRoot(uint _votingId, bytes32 _root) public {
        votingToRoot[_votingId] = _root;
    }
