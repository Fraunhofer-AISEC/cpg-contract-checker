 function MakeClaim(uint _amount, uint _item, uint num) {
   Claim memory c;
   c.healthcareProvider = tx.origin;
   c.patientSig = false;
   c.paid = false;
   c.amount=_amount;
   c.item=_item;
}
