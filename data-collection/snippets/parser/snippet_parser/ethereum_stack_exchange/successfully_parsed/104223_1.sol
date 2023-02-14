Set mySet = new Set(this);


for (uint i = 0; i < mySet.size(); i++) {
  address item = mySet.get(i);
  emit Log(item);
}
