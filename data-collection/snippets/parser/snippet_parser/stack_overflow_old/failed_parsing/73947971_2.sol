Using network 'development'.


Compiling your contracts...
===========================
> Compiling .\src\contracts\SocialNetwork.sol
> Compiling .\src\contracts\SocialNetwork.sol
> Artifacts written to C:\Users\nishu\AppData\Local\Temp\test--6172-Gpy3isbvpCQ9
> Compiled successfully using:
   - solc: 0.5.16+commit.9c3226ce.Emscripten.clang
SyntaxError: C:/Users/nishu/OneDrive/Desktop/blockchain/social-network/src/contracts/SocialNetwork.sol: Unexpected token, expected ; (1:7)      
> 1 | pragma solidity ^0.5.0;
    |        ^
  2 | 
  3 | contract SocialNetwork{
  4 |     string public name;
    at Parser.pp$5.raise (C:\Users\nishu\OneDrive\Desktop\blockchain\social-network\node_modules\babylon\lib\index.js:4454:13)
    at Parser.pp.unexpected (C:\Users\nishu\OneDrive\Desktop\blockchain\social-network\node_modules\babylon\lib\index.js:1761:8)
    at Parser.pp.semicolon (C:\Users\nishu\OneDrive\Desktop\blockchain\social-network\node_modules\babylon\lib\index.js:1742:38)
    at Parser.pp$1.parseExpressionStatement (C:\Users\nishu\OneDrive\Desktop\blockchain\social-network\node_modules\babylon\lib\index.js:2236:8)
    at Parser.pp$1.parseStatement (C:\Users\nishu\OneDrive\Desktop\blockchain\social-network\node_modules\babylon\lib\index.js:1911:17)
    at Parser.pp$1.parseBlockBody (C:\Users\nishu\OneDrive\Desktop\blockchain\social-network\node_modules\babylon\lib\index.js:2268:21)
    at Parser.pp$1.parseTopLevel (C:\Users\nishu\OneDrive\Desktop\blockchain\social-network\node_modules\babylon\lib\index.js:1778:8)
    at Parser.parse (C:\Users\nishu\OneDrive\Desktop\blockchain\social-network\node_modules\babylon\lib\index.js:1673:17)
    at parse (C:\Users\nishu\OneDrive\Desktop\blockchain\social-network\node_modules\babylon\lib\index.js:7305:37)
    at File.parse (C:\Users\nishu\OneDrive\Desktop\blockchain\social-network\node_modules\babel-core\lib\transformation\file\index.js:485:15)
    at File.parseCode (C:\Users\nishu\OneDrive\Desktop\blockchain\social-network\node_modules\babel-core\lib\transformation\file\index.js:570:20)
    at C:\Users\nishu\OneDrive\Desktop\blockchain\social-network\node_modules\babel-core\lib\transformation\pipeline.js:49:12
    at File.wrap (C:\Users\nishu\OneDrive\Desktop\blockchain\social-network\node_modules\babel-core\lib\transformation\file\index.js:532:16)
    at Pipeline.transform (C:\Users\nishu\OneDrive\Desktop\blockchain\social-network\node_modules\babel-core\lib\transformation\pipeline.js:47:17)
    at Object.transformFileSync (C:\Users\nishu\OneDrive\Desktop\blockchain\social-network\node_modules\babel-core\lib\api\node.js:152:10)
    at compile (C:\Users\nishu\OneDrive\Desktop\blockchain\social-network\node_modules\babel-register\lib\node.js:118:20)
    at loader (C:\Users\nishu\OneDrive\Desktop\blockchain\social-network\node_modules\babel-register\lib\node.js:144:14)
    at Object.require.extensions.<computed> [as .js] (C:\Users\nishu\OneDrive\Desktop\blockchain\social-network\node_modules\babel-register\lib\node.js:154:7)  
    at Module.load (node:internal/modules/cjs/loader:981:32)
    at Function.Module._load (node:internal/modules/cjs/loader:822:12)
    at Module.require (node:internal/modules/cjs/loader:1005:19)
    at require (node:internal/modules/cjs/helpers:102:18)
    at Object.<anonymous> (C:/Users/nishu/OneDrive/Desktop/blockchain/social-network/test/SocialNetwork.js:2:23)
    at Module._compile (node:internal/modules/cjs/loader:1101:14)
    at loader (C:\Users\nishu\OneDrive\Desktop\blockchain\social-network\node_modules\babel-register\lib\node.js:144:5)
    at Object.require.extensions.<computed> [as .js] (C:\Users\nishu\OneDrive\Desktop\blockchain\social-network\node_modules\babel-register\lib\node.js:154:7)  
    at Module.load (node:internal/modules/cjs/loader:981:32)
    at Function.Module._load (node:internal/modules/cjs/loader:822:12)
Truffle v5.5.32 (core: 5.5.32)
Node v16.13.1
