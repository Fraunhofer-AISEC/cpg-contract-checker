function iterateListToFindPushIndex() constant returns(uint index){}
function func(intervalNode storage self) { 
  index = iterateListToFindPushIndex();
  self.list.push(Interval( { num: s, next: index }) )
}
