
for (uint i = cotton[address].counter; i > 0; i--) {
  Cotton memory c = cotton[address].cottonHistory[i];
  
  
  emit oracleCotton(c.balance, c.form, c.producer, c.certificate);
  
  ...

}
