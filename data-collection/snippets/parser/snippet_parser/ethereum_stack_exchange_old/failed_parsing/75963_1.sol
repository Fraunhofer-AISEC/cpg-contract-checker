...
require(keys[_key].key != _key, "Key already exists!"); 

Key memory newKeyStruct = Key(msg.sender, _key, _purpose);

keys[_key] = newKeyStruct;
listOfKeys.push(newKeyStruct);
...

