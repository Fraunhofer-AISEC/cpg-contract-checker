Contract D {
    struct Document{
      string name;
      uint value;
    }

    function StoreDocument(bytes32 key, string name, uint value) returns (bool success) {
     var doc = Document(name, value);
     documents[key].push(doc);
     return true;
    }
}
