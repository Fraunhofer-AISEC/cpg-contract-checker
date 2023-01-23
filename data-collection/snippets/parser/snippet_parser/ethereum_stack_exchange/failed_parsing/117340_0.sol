<html>
    <body>
        <span>Input:</span><br>
        <textarea id="input" cols="60" rows="8"> </textarea><br>
        <button id="compile">Compile</button><br>
        <span>Output:</span><br>
        <textarea id="output"></textarea>

        <script src="./browser-solc-min.js" type="text/javascript"></script>
        
        <script>
            let contractCode = `
            contract Test {
                uint256 public number = 2;

                function changeNumber(uint256 _number) external {
                    number = _number;
                }
            }
            `;

            const solidityVersion = "soljson-v0.8.10+commit.fc410830.js";

            document.getElementById("compile").addEventListener("click", () => {
                let sourceCode = {
                    language: "Solidity",
                    sources: { 
                        contract: {
                            content: document.getElementById("input").value
                        }
                    },
                    settings: {
                        optimizer: {
                            enabled: false
                        },
                        evmVersion: "istanbul",
                        outputSelection: {
                            "*": {
                            "": [
                                "legacyAST",
                                "ast"
                            ],
                            "*": [
                                "abi",
                                "evm.bytecode.object",
                                "evm.bytecode.sourceMap",
                                "evm.deployedBytecode.object",
                                "evm.deployedBytecode.sourceMap",
                                "evm.gasEstimates"
                            ]
                            },
                        }
                    }
                };

                
                let result = compiler.compile(JSON.stringify(sourceCode), 1);

                
                document.getElementById("output").value = JSON.stringify(result);
            });

            window.addEventListener('load', async () => {
                document.getElementById("input").value = contractCode;

                
                BrowserSolc.loadVersion(solidityVersion, function(c) {
                    compiler = c;
                });
            });
        </script>
    </body>
</html>
