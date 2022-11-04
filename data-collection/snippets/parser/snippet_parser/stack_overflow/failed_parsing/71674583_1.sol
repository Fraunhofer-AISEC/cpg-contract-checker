type = "directrequest"
schemaVersion = 1
name = "shamba-fire-data"
contractAddress = "0x8114f13FaF377FFc7A5AD32fb8a1e448667b871D"
maxTaskDuration = "0s"
observationSource = """
    decode_log   [type="ethabidecodelog"
                  abi="OracleRequest(bytes32 indexed specId, address requester, bytes32 requestId, uint256 payment, address callbackAddr, bytes4 callbackFunctionId, uint256 cancelExpiration, uint256 dataVersion, bytes data)"
                  data="$(jobRun.logData)"
                  topics="$(jobRun.logTopics)"]

    decode_cbor  [type="cborparse" data="$(decode_log.data)"]
    fetch        [type="bridge" name="shamba-fire-bridge" requestData="{\\"id\\": $(jobSpec.externalJobID), \\"data\\":$(decode_cbor.data)}"]
    parse        [type="jsonparse" path="result,1,0" data="$(fetch)"]
    encode_data  [type="ethabiencode" abi="(uint256 value)" data="{ \\"value\\": $(parse) }"]
    encode_tx    [type="ethabiencode"
                  abi="fulfillOracleRequest2(bytes32 requestId, uint256 payment, address callbackAddress, bytes4 callbackFunctionId, uint256 expiration, bytes calldata data)"
                  data="{\\"requestId\\": $(decode_log.requestId), \\"payment\\": $(decode_log.payment), \\"callbackAddress\\": $(decode_log.callbackAddr), \\"callbackFunctionId\\": $(decode_log.callbackFunctionId), \\"expiration\\": $(decode_log.cancelExpiration), \\"data\\": $(encode_data)}"
                 ]
    submit_tx    [type="ethtx" to="0x8114f13FaF377FFc7A5AD32fb8a1e448667b871D" data="$(encode_tx)"]

    decode_log -> decode_cbor -> fetch -> parse -> encode_data -> encode_tx -> submit_tx
"""
externalJobID = "a3d1b2c9-4524-4e44-bdb4-12c5b5287df3"
