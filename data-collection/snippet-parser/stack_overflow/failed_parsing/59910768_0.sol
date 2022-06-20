✔ Preparing to download box
✔ Downloading
../src/privatekey.cc: In function ‘Nan::NAN_METHOD_RETURN_TYPE privateKeyNegate(Nan::NAN_METHOD_ARGS_TYPE)’:
../src/privatekey.cc:73:30: warning: ignoring return value of ‘int secp256k1_ec_privkey_negate(const secp256k1_context*, unsigned char*)’, declared with attribute warn_unused_result [-Wunused-result]
   secp256k1_ec_privkey_negate(secp256k1ctx, &private_key[0]);
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../src/ecdsa.cc: In function ‘Nan::NAN_METHOD_RETURN_TYPE sign(Nan::NAN_METHOD_ARGS_TYPE)’:
../src/ecdsa.cc:88:131: warning: ignoring return value of ‘v8::Maybe<bool> v8::Object::Set(v8::Local<v8::Context>, v8::Local<v8::Value>, v8::Local<v8::Value>)’, declared with attribute warn_unused_result [-Wunused-result]
   obj->Set(info.GetIsolate()->GetCurrentContext(), Nan::New<v8::String>("signature").ToLocalChecked(), COPY_BUFFER(&output[0], 64));
                                                                                                                                   ^
In file included from /home/lilixac/.cache/node-gyp/12.14.1/include/node/node.h:63:0,
                 from ../src/ecdsa.cc:1:
/home/lilixac/.cache/node-gyp/12.14.1/include/node/v8.h:3408:37: note: declared here
   V8_WARN_UNUSED_RESULT Maybe<bool> Set(Local<Context> context,
                                     ^~~
../src/ecdsa.cc:89:130: warning: ignoring return value of ‘v8::Maybe<bool> v8::Object::Set(v8::Local<v8::Context>, v8::Local<v8::Value>, v8::Local<v8::Value>)’, declared with attribute warn_unused_result [-Wunused-result]
   obj->Set(info.GetIsolate()->GetCurrentContext(), Nan::New<v8::String>("recovery").ToLocalChecked(), Nan::New<v8::Number>(recid));
                                                                                                                                  ^
In file included from /home/lilixac/.cache/node-gyp/12.14.1/include/node/node.h:63:0,
                 from ../src/ecdsa.cc:1:
/home/lilixac/.cache/node-gyp/12.14.1/include/node/v8.h:3408:37: note: declared here
   V8_WARN_UNUSED_RESULT Maybe<bool> Set(Local<Context> context,
                                     ^~~
../src/addon.cpp: In static member function ‘static Nan::NAN_METHOD_RETURN_TYPE SHA3Hash::New(Nan::NAN_METHOD_ARGS_TYPE)’:
../src/addon.cpp:49:23: warning: ‘new’ of type ‘SHA3Hash’ with extended alignment 32 [-Waligned-new=]
    obj = new SHA3Hash();
                       ^
../src/addon.cpp:49:23: note: uses ‘void* operator new(std::size_t)’, which does not have an alignment parameter
../src/addon.cpp:49:23: note: use ‘-faligned-new’ to enable C++17 over-aligned new support
../src/addon.cpp: In static member function ‘static void SHA3Hash::Init(Nan::ADDON_REGISTER_FUNCTION_ARGS_TYPE)’:
../src/addon.cpp:83:27: warning: ‘bool v8::Object::Set(v8::Local<v8::Value>, v8::Local<v8::Value>)’ is deprecated: Use maybe version [-Wdeprecated-declarations]
   target->Set(className, f);
                           ^
In file included from /home/lilixac/.cache/node-gyp/12.14.1/include/node/v8-internal.h:14:0,
                 from /home/lilixac/.cache/node-gyp/12.14.1/include/node/v8.h:25,
                 from /home/lilixac/.cache/node-gyp/12.14.1/include/node/node.h:63,
                 from ../src/addon.cpp:1:
/home/lilixac/.cache/node-gyp/12.14.1/include/node/v8.h:3403:22: note: declared here
                 bool Set(Local<Value> key, Local<Value> value));
                      ^
/home/lilixac/.cache/node-gyp/12.14.1/include/node/v8config.h:311:3: note: in definition of macro ‘V8_DEPRECATED’
   declarator __attribute__((deprecated(message)))
   ^~~~~~~~~~
✔ cleaning up temporary files
✔ Setting up box
