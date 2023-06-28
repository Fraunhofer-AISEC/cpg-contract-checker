contract Journal {

    event Log(string entry);

    function writeLog(string memory entry) public {
        emit Log(entry);
    }
}
