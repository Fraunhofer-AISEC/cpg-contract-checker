contract test{

  mapping(uint8 => bytes32) public check;
  uint8 [] public array;

  function Adddata(string document, uint8 number)  returns (bytes32) {
    check[number] = sha256(document);
    array.push(number);
    return check[number]; 

  }

  function Getdata(uint8 number) returns(bytes32){
    return check[number];
  }
}
