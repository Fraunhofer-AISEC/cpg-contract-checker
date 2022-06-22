uint numElements = 0;
uint[] array;

function insert(uint value) {
    if(numElements == array.length) {
        array.length += 1;
    }
    array[numElements++] = value;
}

function clear() {
    numElements = 0;
}
