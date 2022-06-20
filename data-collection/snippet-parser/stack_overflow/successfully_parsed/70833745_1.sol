contract ExampleContract {
  string public myText = "Hello, world!";

  function getMyText() public view returns (string) {
    return myText;
  }
}
