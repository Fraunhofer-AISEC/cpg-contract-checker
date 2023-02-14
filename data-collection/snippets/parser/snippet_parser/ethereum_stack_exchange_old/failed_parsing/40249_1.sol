 node bridge -H localhost:7545 -a 5

 Please wait...
 [2018-02-20T03:21:51.031Z] INFO you are running ethereum-bridge - version: 0.5.5
 [2018-02-20T03:21:51.033Z] INFO saving logs to: ./bridge.log
 [2018-02-20T03:21:51.034Z] INFO using active mode
 [2018-02-20T03:21:51.034Z] INFO Connecting to eth node 
 http:
 [2018-02-20T03:21:53.953Z] INFO connected to node type EthereumJS TestRPC/v2.0.2/ethereum-js
 [2018-02-20T03:21:54.857Z] WARN Using 0x2932b7a2355d6fecc4b5c0b6bd44cc31df247a2e to query contracts on your blockchain, make sure it is unlocked and do not use the same address to deploy your contracts
 [2018-02-20T03:21:55.087Z] INFO deploying the oraclize connector contract...
 [2018-02-20T03:22:06.056Z] INFO connector deployed to: 0x2fcea879fdc9fe5e90394faf0ca644a1749d0ad6
 [2018-02-20T03:22:06.299Z] INFO deploying the address resolver with a deterministic address...
 [2018-02-20T03:22:30.183Z] INFO address resolver (OAR) deployed to: 0x6f485c8bf6fc43ea212e93bbf8ce046c7f1cb475
 [2018-02-20T03:22:30.184Z] INFO updating connector pricing...
 [2018-02-20T03:22:42.308Z] INFO successfully deployed all contracts
 [2018-02-20T03:22:42.349Z] INFO instance configuration file saved to /home/kottackal/Downloads/ethereumbridge/ethereum-bridge-master/config/instance/oracle_instance_20180220T085242.json

Please add this line to your contract constructor:

OAR = OraclizeAddrResolverI(0x6f485C8BF6fc43eA212E93BBF8ce046C7f1cb475);

[2018-02-20T03:22:42.363Z] WARN re-org block listen is disabled while using TestRPC
[2018-02-20T03:22:42.363Z] WARN if you are running a test suit with Truffle and TestRPC or your chain is reset often please use the --dev mode
[2018-02-20T03:22:42.364Z] INFO Listening @ 0x2fcea879fdc9fe5e90394faf0ca644a1749d0ad6 (Oraclize Connector)

(Ctrl+C to exit)

[2018-02-20T03:26:32.709Z] WARN log with contract myid: 0x1e84508fa52c2d976ef07fe21f02446249a23e0a0b20eeaee263fa309b9c7e49 was triggered, but it was already seen before, skipping event...
