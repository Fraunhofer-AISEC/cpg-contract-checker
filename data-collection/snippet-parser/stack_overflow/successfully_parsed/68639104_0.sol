    function mintBook(uint256 _bookID, uint256 _editionID) external onlyBookAuthor(_bookID) {
        _tokenIds = _tokenIds + 1;
        books[_bookID]._numMinted = books[_bookID]._numMinted + 1;
        books[_bookID].editions[_editionID]._numMinted = books[_bookID].editions[_editionID]._numMinted + 1;

        emit BookMinted(_tokenIds, _editionID, _bookID, books[_bookID].authorID);
        _safeMint(msg.sender, _tokenIds);
    }
