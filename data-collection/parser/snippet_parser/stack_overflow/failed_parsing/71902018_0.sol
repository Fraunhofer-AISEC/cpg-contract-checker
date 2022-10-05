Internal exception in StandardCompiler::compile: C:\Users\circleci\project\libsolidity\ast\AST.cpp(183): Throw in function class std::vector<class solidity::frontend::ErrorDefinition const *,class std::allocator<class solidity::frontend::ErrorDefinition const *> > __cdecl solidity::frontend::ContractDefinition::interfaceErrors(bool) const
Dynamic exception type: struct boost::wrapexcept<struct solidity::langutil::InternalCompilerError>
std::exception::what: 
[struct solidity::util::tag_comment * __ptr64] = 

An unexpected error occurred:

Error: Command failed: C:\Users\Rnsn\AppData\Local\hardhat-nodejs\Cache\compilers\windows-amd64\solc-windows-amd64-v0.8.4+commit.c7e474f2.exe --standard-json

    at ChildProcess.exithandler (node:child_process:399:12)
    at ChildProcess.emit (node:events:526:28)
    at maybeClose (node:internal/child_process:1092:16)
    at Process.ChildProcess._handle.onexit (node:internal/child_process:302:5) {
  killed: false,
  code: 3221225477,
  signal: null,
  cmd: 'C:\\Users\\Rnsn\\AppData\\Local\\hardhat-nodejs\\Cache\\compilers\\windows-amd64\\solc-windows-amd64-v0.8.4+commit.c7e474f2.exe --standard-json'
}
