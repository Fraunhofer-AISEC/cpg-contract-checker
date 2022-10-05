contract ExampleContract {

struct ExampleStruct {
    address owner;
    string text;
}

ExampleStruct[] public exampleStructs;

function ExampleContract( address myAddress, string myText ) {
    exampleStructs.push(ExampleStruct(myAddress, myText));
}

...

}
