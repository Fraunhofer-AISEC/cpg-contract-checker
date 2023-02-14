mapping (string => createParams) private info;
   function initialize(strng memory _title, string memeory _creator, uint _editionLimit) public {
       createParams storage data = info[_title];
       data.title = _title;
       data.creator = _creator;
       data.editionLimit = _editionLimit
    }
