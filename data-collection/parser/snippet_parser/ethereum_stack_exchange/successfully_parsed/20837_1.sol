function getDocumentDetailsByID(bytes32 _ownerID) constant public returns (bytes32[], bytes32[], bytes32[]) {
      uint length = documents.length;

      if(registeredCandidates[_ownerID].clientAddress == msg.sender) {

          bytes32[] memory documentIDs = new bytes32[](length);
          bytes32[] memory names = new bytes32[](length);
          bytes32[] memory descriptions = new bytes32[](length);
          bytes32[] memory docYears = new bytes32[](length);


          for(uint i =0; i < length; i++) {

              if(documents[i].ownerID == _ownerID) {

                  Document memory currentDocument;
                  currentDocument = documents[i];

                  documentIDs[i] = currentDocument.documentID;
                  names[i] = currentDocument.name;

            }
          }


        return (documentIDs, names);  

      } else {
          return;
      }
  }
