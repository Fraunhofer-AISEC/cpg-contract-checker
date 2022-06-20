
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/Counters.sol";

contract TestHub {
  using Counters for Counters.Counter;
  Counters.Counter private _noteIds;

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

  mapping(uint256 => Note) private noteRegistry;
  
  function createNote(
    string calldata _contentUri
  ) external {
    _noteIds.increment();

    address _owner = msg.sender;
    uint256 _noteId = _noteIds.current();

    noteRegistry[_noteId] = Note(
      _noteId,
      _owner,
      _contentId
    );

    emit NoteCreated(_noteId, _owner, _contentId);
  }

  function getNote(uint256 _noteId) public view returns (Note memory) {
    address _owner = msg.sender;

    Note memory noteToCheck = noteRegistry[_noteId];
    Note memory noteToReturn;

    if (noteToCheck.owner == _owner) {
      noteToReturn = noteToCheck;
    }

    return noteToReturn;
  }

  function getNotes() public view returns (Note[] memory) {
    address _owner = msg.sender;
    uint256 totalNotesToQuery = _noteIds.current();
    uint256 noteCount = 0;
    uint256 currentIndex = 0;

    for (uint256 i = 0; i < totalNotesToQuery; i++) {
      if (noteRegistry[i + 1].owner == _owner) {
        noteCount += 1;
      }
    }

    Note[] memory notes = new Note[](noteCount);

    for (uint256 i = 0; i < totalNotesToQuery; i++) {
      if (noteRegistry[i + 1].owner == _owner) {
        Note storage currentNote = noteRegistry[i + 1];
        notes[currentIndex] = currentNote;
        currentIndex += 1;
      }
    }

    return notes;
  }
}
