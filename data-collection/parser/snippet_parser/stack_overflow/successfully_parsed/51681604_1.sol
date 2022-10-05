function viewNotes(address participant) public returns (string) {
    if (bytes(notes[participant]).length != 0) {
        return notes[participant];
    }
}
