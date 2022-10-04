function createDocument() returns (uint docId) {
    docId = documentsCount++;
    documents[docId] = Document(...);
    Created(msg.sender, docId);
}
