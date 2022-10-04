struct Document {
    address[] haveAccess;
}

mapping(uint => Document) public documents;
address[] public arr;

 constructor() {
    documentsCount++;
    documents[documentsCount] = Document(arr);
 }
