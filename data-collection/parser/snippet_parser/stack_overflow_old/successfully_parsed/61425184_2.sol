function createPoni(string memory _code, string memory _imgLink) public onlyOwner poniIsUnique(_code){

    uint randDna = _generateRandomDna(_code);

    
    _createPoni(_code, _imgLink, randDna);
  }

function _createPoni(string memory _code, string memory _imgLink, uint _dna) private {

    uint id = ponies.push(Poni(msg.sender, _code, _imgLink, _dna, 0, true)) - 1;

    poniToOwner[id] = msg.sender;
    codeToId[_code] = id;
    ownerPoniCount[msg.sender] = ownerPoniCount[msg.sender].add(1);

    emit NewPoni(id, _code, _imgLink, _dna);
  }

struct Poni {
    address owner;
    string code;
    string imgLink;
    uint dna;
  }
