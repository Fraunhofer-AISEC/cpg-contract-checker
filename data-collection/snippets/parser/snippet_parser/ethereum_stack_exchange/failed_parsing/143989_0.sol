export function handlePaymentExpenseCreated(
  event: PaymentExpenseCreatedEvent
): void {
  const id: string = getIdFromParams(event.params.param0, event.params.param4);
  let activeExpense = ActiveExpense.load(id);
  let newExpense = new PaymentExpenseCreated(id);

  if (!activeExpense) {
    activeExpense = new ActiveExpense(id);
  }

  newExpense.payer = event.params.param0;
  activeExpense.payer = event.params.param0;

  newExpense.to = event.params.param1;
  activeExpense.to = event.params.param1;

  
  const splitAddresses = event.params.param2.map<Bytes>(
    (address: Bytes) => address
  );
  newExpense.splitBy = splitAddresses;
  activeExpense.splitBy = changetype<Bytes[]>(event.params.param2);

  newExpense.splitAmounts = event.params.param3;
  activeExpense.splitAmounts = event.params.param3;

  newExpense.expenseIndex = event.params.param4;
  activeExpense.expenseIndex = event.params.param4;

  newExpense.blockTimestamp = event.block.timestamp;
  activeExpense.blockTimestamp = event.block.timestamp;

  newExpense.transactionHash = event.transaction.hash;
  activeExpense.transactionHash = event.transaction.hash;

  newExpense.save();
  activeExpense.save();
}
