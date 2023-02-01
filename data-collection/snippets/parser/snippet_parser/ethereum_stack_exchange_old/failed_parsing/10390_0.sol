contract ExampleContract {

struct ExampleStruct {
    address owner,
    string text
}

ExampleStruct[] public exampleStructs;

function ExampleContract( address myAddress, string myText ) {
    ExampleStruct memory es;

    es.owner = myAddress;
    es.text = myText;

    exampleStructs.push(es);
}

...

}
