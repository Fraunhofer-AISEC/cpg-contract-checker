var error = new Error(message);
<ref *1> Error: cannot estimate gas; transaction may fail or may require manual gas limit [ See: https:
 (error={"reason":"cannot estimate gas; transaction may fail or may require manual gas limit","code":"UNPREDICTABLE_GAS_LIMIT","error":{"reason":"processing 
response error","code":"SERVER_ERROR","body":"{\"jsonrpc\":\"2.0\",\"id\":52,\"error\":{\"code\":-32000,\"message\":\"gas required exceeds allowance (0)\"}}"
,"error":{"code":-32000},"requestBody":"{\"method\":\"eth_estimateGas\",\"params\":[{\"gasPrice\":\"0x12a05f200\",\"from\":\"0x116667f6a79605c3da16884a91cf2a
72d9901bf5\",\"to\":\"0xc7c3ccce4fa25700fd5574da7e200ae28bbd36a3\",\"data\":\"0x0902f1ac\"}],\"id\":52,\"jsonrpc\":\"2.0\"}","requestMethod":"POST","url":"ht
tps://bsc-dataseed1.defibit.io"},"method":"estimateGas","transaction":{"from":"0x116667F6A79605c3Da16884a91CF2A72D9901bf5","gasPrice":{"type":"BigNumber","he
x":"0x012a05f200"},"to":"0xc7c3cCCE4FA25700fD5574DA7E200ae28BBd36A3","data":"0x0902f1ac","accessList":null}}, tx={"to":{},"data":"0x0902f1ac","from":"0x11666
7F6A79605c3Da16884a91CF2A72D9901bf5","gasPrice":{"type":"BigNumber","hex":"0x012a05f200"},"type":0,"nonce":{},"gasLimit":{},"chainId":{}}, code=UNPREDICTABLE
_GAS_LIMIT, version=abstract-signer/5.7.0)
    at Logger.makeError (E:\SolidityProject\just-for-test\node_modules\@ethersproject\logger\lib\index.js:238:21)
    at Logger.throwError (E:\SolidityProject\just-for-test\node_modules\@ethersproject\logger\lib\index.js:247:20)
    at E:\SolidityProject\just-for-test\node_modules\@ethersproject\abstract-signer\lib\index.js:365:47
    at processTicksAndRejections (node:internal/process/task_queues:96:5)
    at async Promise.all (index 6) {
  reason: 'cannot estimate gas; transaction may fail or may require manual gas limit',
  code: 'UNPREDICTABLE_GAS_LIMIT',
  error: Error: cannot estimate gas; transaction may fail or may require manual gas limit [ See: https:
 (error={"reason":"processing response error","code":"SERVER_ERROR","body":"{\"jsonrpc\":\"2.0\",\"id\":52,\"error\":{\"code\":-32000,\"message\":\"gas requi
red exceeds allowance (0)\"}}","error":{"code":-32000},"requestBody":"{\"method\":\"eth_estimateGas\",\"params\":[{\"gasPrice\":\"0x12a05f200\",\"from\":\"0x
116667f6a79605c3da16884a91cf2a72d9901bf5\",\"to\":\"0xc7c3ccce4fa25700fd5574da7e200ae28bbd36a3\",\"data\":\"0x0902f1ac\"}],\"id\":52,\"jsonrpc\":\"2.0\"}","r
equestMethod":"POST","url":"https://bsc-dataseed1.defibit.io"}, method="estimateGas", transaction={"from":"0x116667F6A79605c3Da16884a91CF2A72D9901bf5","gasPr
ice":{"type":"BigNumber","hex":"0x012a05f200"},"to":"0xc7c3cCCE4FA25700fD5574DA7E200ae28BBd36A3","data":"0x0902f1ac","accessList":null}, code=UNPREDICTABLE_G
AS_LIMIT, version=providers/5.7.2)
      at Logger.makeError (E:\SolidityProject\just-for-test\node_modules\@ethersproject\logger\lib\index.js:238:21)
      at Logger.throwError (E:\SolidityProject\just-for-test\node_modules\@ethersproject\logger\lib\index.js:247:20)
      at checkError (E:\SolidityProject\just-for-test\node_modules\@ethersproject\providers\lib\json-rpc-provider.js:175:16)
      at JsonRpcProvider.<anonymous> (E:\SolidityProject\just-for-test\node_modules\@ethersproject\providers\lib\json-rpc-provider.js:751:47)
      at step (E:\SolidityProject\just-for-test\node_modules\@ethersproject\providers\lib\json-rpc-provider.js:48:23)
      at Object.throw (E:\SolidityProject\just-for-test\node_modules\@ethersproject\providers\lib\json-rpc-provider.js:29:53)
      at rejected (E:\SolidityProject\just-for-test\node_modules\@ethersproject\providers\lib\json-rpc-provider.js:21:65)
      at processTicksAndRejections (node:internal/process/task_queues:96:5) {
    reason: 'cannot estimate gas; transaction may fail or may require manual gas limit',
    code: 'UNPREDICTABLE_GAS_LIMIT',
    error: Error: processing response error (body="{\"jsonrpc\":\"2.0\",\"id\":52,\"error\":{\"code\":-32000,\"message\":\"gas required exceeds allowance (0)
\"}}", error={"code":-32000}, requestBody="{\"method\":\"eth_estimateGas\",\"params\":[{\"gasPrice\":\"0x12a05f200\",\"from\":\"0x116667f6a79605c3da16884a91c
f2a72d9901bf5\",\"to\":\"0xc7c3ccce4fa25700fd5574da7e200ae28bbd36a3\",\"data\":\"0x0902f1ac\"}],\"id\":52,\"jsonrpc\":\"2.0\"}", requestMethod="POST", url="h
ttps://bsc-dataseed1.defibit.io", code=SERVER_ERROR, version=web/5.7.1)
        at Logger.makeError (E:\SolidityProject\just-for-test\node_modules\@ethersproject\logger\lib\index.js:238:21)
        at Logger.throwError (E:\SolidityProject\just-for-test\node_modules\@ethersproject\logger\lib\index.js:247:20)
        at E:\SolidityProject\just-for-test\node_modules\@ethersproject\web\lib\index.js:313:32
        at step (E:\SolidityProject\just-for-test\node_modules\@ethersproject\web\lib\index.js:33:23)
        at Object.next (E:\SolidityProject\just-for-test\node_modules\@ethersproject\web\lib\index.js:14:53)
        at fulfilled (E:\SolidityProject\just-for-test\node_modules\@ethersproject\web\lib\index.js:5:58)
        at processTicksAndRejections (node:internal/process/task_queues:96:5) {
      reason: 'processing response error',
      code: 'SERVER_ERROR',
      body: '{"jsonrpc":"2.0","id":52,"error":{"code":-32000,"message":"gas required exceeds allowance (0)"}}',
      error: Error: gas required exceeds allowance (0)
          at getResult (E:\SolidityProject\just-for-test\node_modules\@ethersproject\providers\lib\json-rpc-provider.js:191:21)
          at processJsonFunc (E:\SolidityProject\just-for-test\node_modules\@ethersproject\web\lib\index.js:356:22)
          at E:\SolidityProject\just-for-test\node_modules\@ethersproject\web\lib\index.js:288:46
          at step (E:\SolidityProject\just-for-test\node_modules\@ethersproject\web\lib\index.js:33:23)
          at Object.next (E:\SolidityProject\just-for-test\node_modules\@ethersproject\web\lib\index.js:14:53)
          at fulfilled (E:\SolidityProject\just-for-test\node_modules\@ethersproject\web\lib\index.js:5:58)
          at processTicksAndRejections (node:internal/process/task_queues:96:5) {
        code: -32000,
        data: undefined
      },
      requestBody: '{"method":"eth_estimateGas","params":[{"gasPrice":"0x12a05f200","from":"0x116667f6a79605c3da16884a91cf2a72d9901bf5","to":"0xc7c3ccce4fa25
700fd5574da7e200ae28bbd36a3","data":"0x0902f1ac"}],"id":52,"jsonrpc":"2.0"}',
      requestMethod: 'POST',
      url: 'https://bsc-dataseed1.defibit.io'
    },
    method: 'estimateGas',
    transaction: {
      from: '0x116667F6A79605c3Da16884a91CF2A72D9901bf5',
      gasPrice: BigNumber { _hex: '0x012a05f200', _isBigNumber: true },
      to: '0xc7c3cCCE4FA25700fD5574DA7E200ae28BBd36A3',
      data: '0x0902f1ac',
      accessList: null
    }
  },
  tx: {
    to: Promise { '0xc7c3cCCE4FA25700fD5574DA7E200ae28BBd36A3' },
    data: '0x0902f1ac',
    from: '0x116667F6A79605c3Da16884a91CF2A72D9901bf5',
    gasPrice: BigNumber { _hex: '0x012a05f200', _isBigNumber: true },
    type: 0,
    nonce: Promise { 0 },
    gasLimit: Promise { <rejected> [Circular *1] },
    chainId: Promise { 56 }
  }
}
