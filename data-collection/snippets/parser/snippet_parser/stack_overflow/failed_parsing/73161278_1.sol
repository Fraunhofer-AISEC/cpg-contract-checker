WARN  deprecated urix@0.1.0: Please see https:
WARN  deprecated resolve-url@0.2.1: https:
Packages: +1488
    +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Packages are hard linked from the content-addressable store to the virtual store.
  Content-addressable store is at: /Users/sh06010ml2/Library/pnpm/store/v3
  Virtual store is at:             node_modules/.pnpm
Progress: resolved 1583, reused 1480, downloaded 6, added 1488, done
node_modules/.pnpm/secp256k1@3.8.0/node_modules/secp256k1: Running install script...
node_modules/.pnpm/keccak@3.0.2/node_modules/keccak: Running install script...
node_modules/.pnpm/node-hid@0.7.9/node_modules/node-hid: Running install script, failed in 5s
.../node-hid@0.7.9/node_modules/node-hid install$ prebuild-install || node-gyp rebuild
│ prebuild-install WARN install No prebuilt binaries found (target=16.16.0 runtime=node arch=arm64 libc= platform=darwin)
│ gyp info it worked if it ends with ok
│ gyp info using node-gyp@8.4.1
│ gyp info using node@16.16.0 | darwin | arm64
│ gyp info find Python using Python version 3.8.9 found at "/Applications/Xcode.app/Contents/Developer/usr/bin/python3"
│ gyp info spawn /Applications/Xcode.app/Contents/Developer/usr/bin/python3
│ gyp info spawn args [
│ gyp info spawn args   '/Users/sh06010ml2/Library/pnpm-global/5/node_modules/.pnpm/pnpm@7.5.1/node_modules/pnpm/dist/node_modules/node-gyp/gyp/gyp_main.py',
│ gyp info spawn args   'binding.gyp',
│ gyp info spawn args   '-f',
│ gyp info spawn args   'make',
│ gyp info spawn args   '-I',
│ gyp info spawn args   '/Users/sh06010ml2/Documents/workspaces/learns/hardhat-smartcontract-lottery-fcc/node_modules/.pnpm/node-hid@0.7.9/node_modules/node-hid/build/config.gypi',
│ gyp info spawn args   '-I',
│ gyp info spawn args   '/Users/sh06010ml2/Library/pnpm-global/5/node_modules/.pnpm/pnpm@7.5.1/node_modules/pnpm/dist/node_modules/node-gyp/addon.gypi',
│ gyp info spawn args   '-I',
│ gyp info spawn args   '/Users/sh06010ml2/Library/Caches/node-gyp/16.16.0/include/node/common.gypi',
│ gyp info spawn args   '-Dlibrary=shared_library',
│ gyp info spawn args   '-Dvisibility=default',
│ gyp info spawn args   '-Dnode_root_dir=/Users/sh06010ml2/Library/Caches/node-gyp/16.16.0',
│ gyp info spawn args   '-Dnode_gyp_dir=/Users/sh06010ml2/Library/pnpm-global/5/node_modules/.pnpm/pnpm@7.5.1/node_modules/pnpm/dist/node_modules/node-gyp',
│ gyp info spawn args   '-Dnode_lib_file=/Users/sh06010ml2/Library/Caches/node-gyp/16.16.0/<(target_arch)/node.lib',
│ gyp info spawn args   '-Dmodule_root_dir=/Users/sh06010ml2/Documents/workspaces/learns/hardhat-smartcontract-lottery-fcc/node_modules/.pnpm/node-hid@0.7.9/node_modules/node-hid',
│ gyp info spawn args   '-Dnode_engine=v8',
│ gyp info spawn args   '--depth=.',
│ gyp info spawn args   '--no-parallel',
│ gyp info spawn args   '--generator-output',
│ gyp info spawn args   'build',
│ gyp info spawn args   '-Goutput_dir=.'
│ gyp info spawn args ]
│ gyp info spawn make
│ gyp info spawn args [ 'BUILDTYPE=Release', '-C', 'build' ]
│   CC(target) Release/obj.target/hidapi/hidapi/mac/hid.o
│   LIBTOOL-STATIC Release/hidapi.a
│   CXX(target) Release/obj.target/HID/src/HID.o
│ ../src/HID.cc:612:31: error: too few arguments to function call, expected 3, have 2
│   node::AtExit(deinitialize, 0);
│   ~~~~~~~~~~~~                ^
│ /Users/sh06010ml2/Library/Caches/node-gyp/16.16.0/include/node/node.h:939:18:
