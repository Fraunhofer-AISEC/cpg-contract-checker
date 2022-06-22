external[] mylist;

struct external {
  string id;
  string name1:
  internal[] internalList;
};

struct internal {
  string name2;
  uint256 ammount;
}

function addElement(string memory _id,
                    string memory _name1,
                    string memory _name2,
                    uint256 _ammount ) public restricted{
   internal memory intl = internal(_name2, _ammount);
   myList.push(external(_id, _name1, intl);
}
