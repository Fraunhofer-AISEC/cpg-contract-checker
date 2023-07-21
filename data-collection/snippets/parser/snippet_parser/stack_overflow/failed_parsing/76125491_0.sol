- Created Treasury account 0.0.4392985 that has a balance of 100 ℏ
- Created Alice's account 0.0.4392988 that has a balance of 100 ℏ

- Deploying contract...
- The smart contract ID is: 0.0.4392992
- The smart contract ID in Solidity format is: 0000000000000000000000000000000000430820

- Token ID (for association with contract later): 0.0.47931765

====================================================
GETTING HBAR TO THE CONTRACT
====================================================
- Caller (Operator) PAYS 10 ℏ to contract (fallback/receive)...
- Contract balance (getBalance fcn): 10 ℏ

- Caller (Operator) PAYS 21 ℏ to contract (payable function)...
/Users/michellacerone/Desktop/hedera-sc/node_modules/@hashgraph/sdk/lib/ReceiptStatusError.cjs:43
    super(props, `receipt for transaction ${props.transactionId.toString()} contained error status ${props.status.toString()}`);
    ^

ReceiptStatusError: receipt for transaction 0.0.3969463@1682422103.737727129 contained error status CONTRACT_REVERT_EXECUTED
    at new ReceiptStatusError (/Users/michellacerone/Desktop/hedera-sc/node_modules/@hashgraph/sdk/lib/ReceiptStatusError.cjs:43:5)
    at TransactionReceiptQuery._mapStatusError (/Users/michellacerone/Desktop/hedera-sc/node_modules/@hashgraph/sdk/lib/transaction/TransactionReceiptQuery.cjs:273:12)
    at TransactionReceiptQuery.execute (/Users/michellacerone/Desktop/hedera-sc/node_modules/@hashgraph/sdk/lib/Executable.cjs:644:22)
    at process.processTicksAndRejections (node:internal/process/task_queues:95:5)
    at async TransactionResponse.getReceipt (/Users/michellacerone/Desktop/hedera-sc/node_modules/@hashgraph/sdk/lib/transaction/TransactionResponse.cjs:86:21)
    at async contractExecuteFcn (/Users/michellacerone/Desktop/hedera-sc/index.js:181:28)
    at async main (/Users/michellacerone/Desktop/hedera-sc/index.js:67:13) {
  status: Status { _code: 33 },
  transactionId: TransactionId {
    accountId: AccountId {
      shard: Long { low: 0, high: 0, unsigned: false },
      realm: Long { low: 0, high: 0, unsigned: false },
      num: Long { low: 3969463, high: 0, unsigned: false },
      aliasKey: null,
      evmAddress: null,
      _checksum: null
    },
    validStart: Timestamp {
      seconds: Long { low: 1682422103, high: 0, unsigned: false },
      nanos: Long { low: 737727129, high: 0, unsigned: false }
    },
    scheduled: false,
    nonce: null
  },
  transactionReceipt: TransactionReceipt {
    status: Status { _code: 33 },
    accountId: null,
    fileId: null,
    contractId: ContractId {
      shard: Long { low: 0, high: 0, unsigned: false },
      realm: Long { low: 0, high: 0, unsigned: false },
      num: Long { low: 4392992, high: 0, unsigned: false },
      evmAddress: null,```

How can I fix this? What does this error mean?
