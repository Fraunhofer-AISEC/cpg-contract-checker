function registerStudentEvaluation(string memory _firstName, string memory _lastName, string memory _subject, uint _note) public returns(Note memory) {
        bytes32 studentHash = keccak256(abi.encodePacked(_firstName, _lastName));
        bytes32 subjectHash = keccak256(abi.encode(_subject));
        address teacherAddress = msg.sender;

        assert (students[studentHash] && subjects[subjectHash] && teachers[msg.sender]);

        Note memory newNote = Note(studentHash, subjectHash, msg.sender, _note);
        bytes32 noteHash = keccak256(abi.encodePacked(studentHash, subjectHash, msg.sender, _note));
        notes[noteHash] = newNote;

        emit student_evaluated(noteHash);

        return newNote;
    }
