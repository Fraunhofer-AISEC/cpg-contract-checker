function getAllPerson()  view external returns(uint[] memory entries) {
    entries = new uint[](personeNames.length);
    for (uint i = 0; i < personeNames.length; i++) {
        entries[i] = person[personeNames[i]];
    }
}
