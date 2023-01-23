int128[] elements;
int128 numberOfElements;

function hasElement(int128 element) returns (bool) {
    for ( int128 i = 0; i < numberOfElements; i++ ) {
        if (elements[i] == element) {
            return true;
        }
    }
    return false;
}
