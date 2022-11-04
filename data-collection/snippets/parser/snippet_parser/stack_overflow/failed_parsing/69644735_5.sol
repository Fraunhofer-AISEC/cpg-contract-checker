<myusername>@<mycomputername> contracts % node deploy.js           
{
  errors: [
    {
      component: 'general',
      errorCode: '1878',
      formattedMessage: 'Warning: SPDX license identifier not provided in source file. Before publishing, consider adding a comment containing "SPDX-License-Identifier: <SPDX-License>" to each source file. Use "SPDX-License-Identifier: UNLICENSED" for non-open-source code. Please see https://spdx.org for more information.\n' +
        '--> CExampleToken.sol\n' +
        '\n',
      message: 'SPDX license identifier not provided in source file. Before publishing, consider adding a comment containing "SPDX-License-Identifier: <SPDX-License>" to each source file. Use "SPDX-License-Identifier: UNLICENSED" for non-open-source code. Please see https://spdx.org for more information.',
      severity: 'warning',
      sourceLocation: [Object],
      type: 'Warning'
    },
    {
      component: 'general',
      errorCode: '6275',
      formattedMessage: 'ParserError: Source "@openzeppelin/contracts/token/ERC20/ERC20.sol" not found: File import callback not supported\n' +
        ' --> CExampleToken.sol:3:1:\n' +
        '  |\n' +
        '3 | import "@openzeppelin/contracts/token/ERC20/ERC20.sol";\n' +
        '  | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n' +
        '\n',
      message: 'Source "@openzeppelin/contracts/token/ERC20/ERC20.sol" not found: File import callback not supported',
      severity: 'error',
      sourceLocation: [Object],
      type: 'ParserError'
    },
    {
      component: 'general',
      errorCode: '6275',
      formattedMessage: 'ParserError: Source "@openzeppelin/contracts/token/ERC20/ERC20Detailed.sol" not found: File import callback not supported\n' +
        ' --> CExampleToken.sol:4:1:\n' +
        '  |\n' +
        '4 | import "@openzeppelin/contracts/token/ERC20/ERC20Detailed.sol";\n' +
        '  | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n' +
        '\n',
      message: 'Source "@openzeppelin/contracts/token/ERC20/ERC20Detailed.sol" not found: File import callback not supported',
      severity: 'error',
      sourceLocation: [Object],
      type: 'ParserError'
    }
  ],
  sources: {}
}
/Users/<myusername>/Desktop/Coding/CodingTestSpace/MoonbeamTutorial101921/contracts/compile.js:24
const contractFile = tempFile.contracts['CExampleToken.sol']['CExampleToken'];
                                       ^

TypeError: Cannot read properties of undefined (reading 'CExampleToken.sol')
    at Object.<anonymous> (/Users/<myusername>/Desktop/Coding/CodingTestSpace/MoonbeamTutorial101921/contracts/compile.js:24:40)
    at Module._compile (node:internal/modules/cjs/loader:1101:14)
    at Object.Module._extensions..js (node:internal/modules/cjs/loader:1153:10)
    at Module.load (node:internal/modules/cjs/loader:981:32)
    at Function.Module._load (node:internal/modules/cjs/loader:822:12)
    at Module.require (node:internal/modules/cjs/loader:1005:19)
    at require (node:internal/modules/cjs/helpers:102:18)
    at Object.<anonymous> (/Users/<myusername>/Desktop/Coding/CodingTestSpace/MoonbeamTutorial101921/contracts/deploy.js:2:22)
    at Module._compile (node:internal/modules/cjs/loader:1101:14)
    at Object.Module._extensions..js (node:internal/modules/cjs/loader:1153:10)
    at Module.load (node:internal/modules/cjs/loader:981:32)
    at Function.Module._load (node:internal/modules/cjs/loader:822:12)
    at Function.executeUserEntryPoint [as runMain] (node:internal/modules/run_main:79:12)
    at node:internal/main/run_main_module:17:47
<myusername>@<mycomputername> contracts % 
