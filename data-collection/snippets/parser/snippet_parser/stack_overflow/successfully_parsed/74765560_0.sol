contract HelloWorld {
    string public text = "Hello World";

    event NewText(
        string _text
    );

    constructor() {
        
    }

    function setText(string memory _text) public {
        text = _text;
        emit NewText(_text);
    }
}
