type                = "directrequest"
schemaVersion       = 1
name                = "Get > Bytes32"
contractAddress     = "0x19f7f3bF88CB208B0C422CC2b8E2bd23ee461DD1"
externalJobID       = "0EEC7E1D-D0D2-476C-A1A8-72DFB6633F47" # OPTIONAL - if left unspecified, a random value will be automatically generated
observationSource   = """
    decode_log   [type=ethabidecodelog
                  abi="OracleRequest(bytes32 indexed specId, address requester, bytes32 requestId, uint256 payment, address callbackAddr, bytes4 callbackFunctionId, uint256 cancelExpiration, uint256 dataVersion, bytes data)"
                  data="$(jobRun.logData)"
                  topics="$(jobRun.logTopics)"]

    decode_cbor  [type=cborparse data="$(decode_log.data)"]
    fetch        [type=http method=get url="$(decode_cbor.url)"]
    parse        [type=jsonparse path="$(decode_cbor.path)"]
    encode_data  [type=ethabiencode abi="(uint256 value)" data=<{ "value": $(parse) }>]
    encode_tx    [type=ethabiencode
                  abi="fulfillOracleRequest(bytes32 requestId, uint256 payment, address callbackAddress, bytes4 callbackFunctionId, uint256 expiration, bytes32 data)"
                  data=<{
                      "requestId": $(decode_log.requestId),
                      "payment": $(decode_log.payment),
                      "callbackAddress": $(decode_log.callbackAddr),
                      "callbackFunctionId": $(decode_log.callbackFunctionId),
                      "expiration": $(decode_log.cancelExpiration),
                      "data": $(encode_data)
                  }>]
    submit       [type=ethtx to="$(jobSpec.contractAddress)" data="$(encode_tx)"]

    decode_log -> decode_cbor -> fetch -> parse -> encode_data -> encode_tx -> submit
"""