TextThatDoesNotWork[] textArray;

function put(bytes32 s, uint r, address a) public {
    textArray.push(TextThatDoesNotWork({
        text: s, 
        reads: r,
        addr: a
    }));
}
