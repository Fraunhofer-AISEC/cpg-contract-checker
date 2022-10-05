contract Notes {
    struct notes {
        string id;
        string content;
        address owner;
        bool isCreated;
        bool isDeleted;
        uint256 timestamp;
    }

    mapping(address => mapping(string =>notes)) private userNotes;

    function addNote(string memory _content, string memory _noteId) public {
        require(!userNotes[msg.sender][_noteId].isCreated,"a Note is already Created With This Id");
        userNotes[msg.sender][_noteId] =notes(_noteId, _content,msg.sender, true, false, now);
    }
}
