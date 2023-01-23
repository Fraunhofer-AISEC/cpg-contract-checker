
pragma solidity ^0.8.0;

contract Hub {
    event NoteCreated(
        uint256 indexed noteId,
        address indexed owner,
        bytes32 contentId
    );

    struct Note {
        uint256 noteId;
        address owner;
        bytes32 contentId;
    }
    mapping(address => mapping(uint256 => Note)) private noteRegistry;
    mapping(address => uint256) private addressToNumberOfNotes;

    function createNote(string calldata _contentUri) external {
        address _owner = msg.sender;
        uint256 _noteId = addressToNumberOfNotes[_owner] + 1;
        bytes32 _contentId = keccak256(abi.encode(_contentUri));

        addressToNumberOfNotes[_owner] = _noteId;
        noteRegistry[_owner][_noteId] = Note(_noteId, _owner, _contentId);

        emit NoteCreated(_noteId, _owner, _contentId);
    }

    function getNote(uint256 _noteId) public view returns (Note memory) {
        address _owner = msg.sender;

        Note memory note = noteRegistry[_owner][_noteId];

        require(
            note.owner == _owner,
            "You can't get notes that doesn't belong to you!"
        );

        return note;
    }

    function getNotes() public view returns (Note[] memory) {
        address _owner = msg.sender;

        Note[] memory notes = new Note[](addressToNumberOfNotes[_owner]);

        for (uint256 i = 0; i < addressToNumberOfNotes[_owner]; i++) {
            Note storage currentNote = noteRegistry[_owner][i];
            notes[i] = currentNote;
        }

        return notes;
    }
}
