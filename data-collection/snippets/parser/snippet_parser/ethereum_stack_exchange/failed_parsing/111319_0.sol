 imports "./FooFunctions.sol"
 contract Foo {
     
     mapping(string=>string[]) private _dictionary;
     string[] private _keyList;

     function getDocument() public view returns(string) {
        return FooFunctions.createDocument(_dictionary, _keyList);
     }
}
