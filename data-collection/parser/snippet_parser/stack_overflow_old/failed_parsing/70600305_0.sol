    event PostCreated (bytes32 indexed postId, address indexed postOwner, bytes32 indexed parentId, bytes32 contentId, bytes32 categoryId);
event ContentAdded (bytes32 indexed contentId, string contentUri);
event CategoryCreated (bytes32 indexed categoryId, string category);
event Voted (bytes32 indexed postId, address indexed postOwner, address indexed voter, uint80 reputationPostOwner, uint80 reputationVoter, int40 postVotes, bool up, uint8 reputationAmount);

struct post {
    address postOwner;
    bytes32 parentPost;
    bytes32 contentId;
    int40 votes;
    bytes32 categoryId;
}

mapping  (address => mapping (bytes32 => uint80)) reputationRegistry;
mapping (bytes32 => string) categoryRegistry;
mapping (bytes32 => string) contentRegistry;
mapping (bytes32 => post) postRegistry;
mapping (address => mapping (bytes32 => bool)) voteRegistry;

function createPost(bytes32 _parentId, string calldata _contentUri, bytes32 _categoryId) external {
    address _owner = msg.sender;
    bytes32 _contentId = keccak256(abi.encode(_contentUri));
    bytes32 _postId = keccak256(abi.encodePacked(_owner,_parentId, _contentId));
    contentRegistry[_contentId] = _contentUri;
    postRegistry[_postId].postOwner = _owner;
    postRegistry[_postId].parentPost = _parentId;
    postRegistry[_postId].contentId = _contentId;
    postRegistry[_postId].categoryId = _categoryId;
    emit ContentAdded(_contentId, _contentUri);
    emit PostCreated (_postId, _owner,_parentId,_contentId,_categoryId);
}
