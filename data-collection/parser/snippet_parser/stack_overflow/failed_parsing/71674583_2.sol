type = "directrequest"
schemaVersion = 1
name = "shamba-fire-data"
contractAddress = "0xf4434feDd55D3d6573627F39fA39867b23f4Bf7F"
maxTaskDuration = "0s"
observationSource = """
    decode_log   [type="ethabidecodelog"
                  abi="OracleRequest(bytes32 indexed specId, address requester, bytes32 requestId, uint256 payment, address callbackAddr, bytes4 callbackFunctionId, uint256 cancelExpiration, uint256 dataVersion, bytes data)"
                  data="$(jobRun.logData)"
                  topics="$(jobRun.logTopics)"]

    decode_cbor  [type="cborparse" data="$(decode_log.data)"]
    fetch        [type="bridge" name="shamba-fire-bridge" requestData="{\\"id\\": $(jobSpec.externalJobID), \\"data\\":$(decode_cbor.data)}"]
    parse        [type="jsonparse" path="result" data="$(fetch)"]
    encode_data  [type="ethabiencode" abi="(bytes32 requestId, uint256[][] value)" data="{ \\"requestId\\": $(decode_log.requestId), \\"value\\": $(parse) }"]
    encode_tx    [type="ethabiencode"
                  abi="fulfillOracleRequest2(bytes32 requestId, uint256 payment, address callbackAddress, bytes4 callbackFunctionId, uint256 expiration, bytes calldata data)"
                  data="{\\"requestId\\": $(decode_log.requestId), \\"payment\\": $(decode_log.payment), \\"callbackAddress\\": $(decode_log.callbackAddr), \\"callbackFunctionId\\": $(decode_log.callbackFunctionId), \\"expiration\\": $(decode_log.cancelExpiration), \\"data\\": $(encode_data)}"
                 ]
    submit_tx    [type="ethtx" to="0xf4434feDd55D3d6573627F39fA39867b23f4Bf7F" data="$(encode_tx)"]

    decode_log -> decode_cbor -> fetch -> parse -> encode_data -> encode_tx -> submit_tx
"""
externalJobID = "66229880-79e1-43c6-9d9e-0eb4b668729d"
