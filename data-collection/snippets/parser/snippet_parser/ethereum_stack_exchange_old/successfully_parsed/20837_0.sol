function storeDocument (bytes32 _ownerID , bytes32 _documentID, bytes32 _name)  {
      Document memory newDoc;

      newDoc.ownerID = _ownerID;
      newDoc.documentID = _documentID;
      newDoc.name = _name;

      documents.push(newDoc);         

    }
