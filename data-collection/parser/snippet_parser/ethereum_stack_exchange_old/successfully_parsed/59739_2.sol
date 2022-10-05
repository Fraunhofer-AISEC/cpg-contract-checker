function put(bytes32 _text, uint _reads) public returns (uint){
    return textArray.push(TextThatDoesNotWork({
        text: _text,
        reads: _reads,
        addr: msg.sender
    }))-1;
}
