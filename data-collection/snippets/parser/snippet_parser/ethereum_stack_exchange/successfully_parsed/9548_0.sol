

string[] myArray;

function serializeArray() returns (string serializedArray) {
  uint arrayLength = myArray.length;
  string serialized = '[';

  for (uint i = 0; i < arrayLength; i++) {
    serialized += '"';
    serialized += inbox[i];
    serialized += '"';

    if (i < arrayLength) {
      serialized += ',';
    }
  }
  serialized += ']';

  return serialized;
}
