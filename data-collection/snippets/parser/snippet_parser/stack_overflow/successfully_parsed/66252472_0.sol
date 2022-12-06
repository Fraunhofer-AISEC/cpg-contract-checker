function newChild() {
     Child child = new Child(potentialPayoutAmount);
     children[_childId] = address(child);
}

function getChild()view public returns (address)  {
   return children[_campaignId];
}
