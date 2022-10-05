    [2019-05-28T08:54:50.206Z] INFO new HTTP query created, id: 72e3a263387ed365d97bc97a64c601380a5b4e8bbd1b3740bcc2af1e2bc97b19
[2019-05-28T08:54:50.215Z] INFO checking HTTP query 72e3a263387ed365d97bc97a64c601380a5b4e8bbd1b3740bcc2af1e2bc97b19 status in 0 seconds
[2019-05-28T08:54:50.215Z] INFO checking HTTP query 72e3a263387ed365d97bc97a64c601380a5b4e8bbd1b3740bcc2af1e2bc97b19 status every 5 seconds...
[2019-05-28T08:54:56.634Z] INFO 72e3a263387ed365d97bc97a64c601380a5b4e8bbd1b3740bcc2af1e2bc97b19 HTTP query result: 
    {
    "result": {
        "_timestamp": 1559033691,
        "id": "72e3a263387ed365d97bc97a64c601380a5b4e8bbd1b3740bcc2af1e2bc97b19",
        "daterange": [
            1559033689,
            1559035489
        ],
        "_lock": false,
        "id2": "72fdf59adf3ecc92244e3b173ce1657252ab5eb877c3569a393599d34dd2c848",
        "actions": [],
        "interval": 3600,
        "checks": [
            {
                "errors": [
                    "TypeError",
                    "parsing_helper.wrong_path"
                ],
                "success": true,
                "timestamp": 1559033691,
                "results": [
                    ""
                ],
                "proofs": [
                    null
                ],
                "match": true
            }
        ],
        "version": 3,
        "_timestamp_creation": 1559033689,
        "context": {
            "protocol": "eth",
            "relative_timestamp": 1559033687,
            "type": "blockchain",
            "name": "eth_AB65E563DB"
        },
        "active": false,
        "hidden": false,
        "payload": {
            "conditions": [
                {
                    "query": [
                        "json(https://purple-squid-54.localtunnel.me).a",
                        "28189689"
                    ],
                    "proof_type": 0,
                    "check_op": "tautology",
                    "datasource": "URL",
                    "value": null
                }
            ]
        }
    },
    "success": true
}
[2019-05-28T08:54:56.637Z] ERROR HTTP query error
    [
    "TypeError",
    "parsing_helper.wrong_path"
]
[2019-05-28T08:54:56.639Z] INFO sending __callback tx...
    {
    "contract_myid": "0x72fdf59adf3ecc92244e3b173ce1657252ab5eb877c3569a393599d34dd2c848",
    "contract_address": "0x481a276d14a6a74e1ec1f74b64c2af226ba7033c"
}
[2019-05-28T08:55:01.853Z] INFO contract 0x481a276d14a6a74e1ec1f74b64c2af226ba7033c __callback tx sent, transaction hash: 0xfada229b6f9860e0717b3a098dd93aaef280852dbf75109c830b555c488e6c81
    {
    "myid": "0x72fdf59adf3ecc92244e3b173ce1657252ab5eb877c3569a393599d34dd2c848",
    "result": "",
    "proof": null,
    "proof_type": "0x00",
    "contract_address": "0x481a276d14a6a74e1ec1f74b64c2af226ba7033c",
    "gas_limit": 200000,
    "gas_price": null
}
