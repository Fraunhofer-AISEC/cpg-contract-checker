string[] public saved_texts;

function getSavedTextsCount() public constant returns(uint) {
    return saved_texts.length;
}
