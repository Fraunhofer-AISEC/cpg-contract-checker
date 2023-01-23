Traceback (most recent call last):
  File ".\main.py", line 68, in <module>
    main()
  File ".\main.py", line 57, in main
    compiled_sol = compile_source_file('contract.sol')
  File ".\main.py", line 20, in compile_source_file
    return solcx.compile_source(source)
  File "C:\Program Files (x86)\Python37-32\lib\site-packages\solcx\main.py", line 130, in compile_source
    allow_empty=allow_empty,
  File "C:\Program Files (x86)\Python37-32\lib\site-packages\solcx\main.py", line 277, in _compile_combined_json
    combined_json = _get_combined_json_outputs(solc_binary)
  File "C:\Program Files (x86)\Python37-32\lib\site-packages\solcx\main.py", line 242, in _get_combined_json_outputs
    help_str = wrapper.solc_wrapper(solc_binary=solc_binary, help=True)[0].split("\n")
  File "C:\Program Files (x86)\Python37-32\lib\site-packages\solcx\wrapper.py", line 163, in solc_wrapper
    stderr_data=stderrdata,
solcx.exceptions.SolcError: An error occurred during execution
> command: `C:\Users\Nikesh\.solcx\solc-v0.8.11\solc.exe --help -`
> return code: `0`
> stdout:
solc, the Solidity commandline compiler.

This program comes with ABSOLUTELY NO WARRANTY. This is free software, and you
are welcome to redistribute it under certain conditions. See 'solc --license'
for details.

Usage: solc [options] [input_file...]
Compiles the given Solidity input files (or the standard input if none given or
"-" is used as a file name) and outputs the components specified in the options
at standard output or in files in the output directory, if specified.
Imports are automatically read from the filesystem, but it is also possible to
remap paths using the context:prefix=path syntax.
Example:
solc --bin -o /tmp/solcoutput dapp-bin=/usr/local/lib/dapp-bin contract.sol

General Information:
  --help               Show help message and exit.
  --version            Show version and exit.
  --license            Show licensing information and exit.
  --input-file arg     input file

Input Options:
  --base-path path     Use the given path as the root of the source tree
                       instead of the root of the filesystem.
  --include-path path  Make an additional source directory available to the
                       default import callback. Use this option if you want to
                       import contracts whose location is not fixed in relation
                       to your main source tree, e.g. third-party libraries
                       installed using a package manager. Can be used multiple
                       times. Can only be used if base path has a non-empty
                       value.
  --allow-paths path(s)
                       Allow a given path for imports. A list of paths can be
                       supplied by separating them with a comma.
  --ignore-missing     Ignore missing files.
  --error-recovery     Enables additional parser error recovery.
