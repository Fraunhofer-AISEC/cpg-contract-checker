pragma solidity >=0.5.0 <0.7.0;

import "@aztec/protocol/contracts/libs/NoteUtils.sol";

library EscrowUtils {
    using NoteUtils for bytes;

    struct Note {
        address owner;
        bytes32 noteHash;
    }

    function noteBytesToStruct(bytes memory note)
        internal
        pure
        returns (Note memory codedNote)
    {
        (address owner, bytes32 noteHash, ) = note.extractNote();
        return Note(owner, noteHash);
    }
}
