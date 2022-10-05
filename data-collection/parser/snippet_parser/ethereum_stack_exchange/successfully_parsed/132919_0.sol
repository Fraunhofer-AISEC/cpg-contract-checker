
pragma experimental ABIEncoderV2;
contract test {

struct document{
   string ipfsHash;
   string documentName;
   bytes32 accessKey;
}

struct grantAccess{
   address owner;
   address single;     
}
}