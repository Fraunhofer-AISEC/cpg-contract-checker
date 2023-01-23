int128[] elements;
uint numberOfElements;

function hasElement(int128 element) returns (bool) {
    for ( uint i = 0; i < numberOfElements; i++ ) {
        if (elements[i] == element) {
            return true;
        }
    }
    return false;
}
