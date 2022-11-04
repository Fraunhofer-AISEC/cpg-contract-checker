contract LoanRecord {
  public bool on;
  ...

  constructor(...){
    ...
    on = false;
   }

  function external turnOn(){
    on = true;
  }
}
