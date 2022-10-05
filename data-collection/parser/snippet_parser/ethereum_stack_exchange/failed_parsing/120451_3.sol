{
  call: [Function: bound _executeMethod] {
    request: [Function: bound _executeMethod]
  },
  send: [Function: bound _executeMethod] {
    request: [Function: bound _executeMethod]
  },
  encodeABI: [Function: bound _encodeMethodABI],
  estimateGas: [Function: bound _executeMethod],
  createAccessList: [Function: bound _executeMethod],
  arguments: [
    7,
    0,
    1000000000000000000,
    'address of accounts[0]',
    10,
    2000000000000000000,
    'address of accounts[0]',
    0
  ],
  _method: {
    inputs: [
      [Object], [Object],
      [Object], [Object],
      [Object], [Object],
      [Object], [Object]
    ],
    name: 'wrap721',
    outputs: [ [Object] ],
    stateMutability: 'payable',
    type: 'function',
    constant: undefined,
    payable: true,
    signature: '0x2321f8ba'
  },
  _parent: Contract {
    setProvider: [Function (anonymous)],
    currentProvider: [Getter/Setter],
    _requestManager: RequestManager {
      provider: [Function],
      providers: [Object],
      subscriptions: Map(0) {}
    },
    givenProvider: null,
    providers: {
      WebsocketProvider: [Function: WebsocketProvider],
      HttpProvider: [Function: HttpProvider],
      IpcProvider: [Function: IpcProvider]
    },
