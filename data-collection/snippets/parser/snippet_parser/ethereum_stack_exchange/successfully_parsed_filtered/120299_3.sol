    function getStudentsMarks(uint256[] memory _ids) public view returns (string[] memory answers, address _sender) {
        string[] memory answers = new string[](_ids.length);
        for (uint256 i; i < _ids.length; i++) {
            answers[i] = students[i].answers;
        }

        return (answers, msg.sender);
    }

