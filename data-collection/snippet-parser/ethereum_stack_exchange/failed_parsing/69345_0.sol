==== JS stack trace =========================================

    0: ExitFrame [pc: 0000007F84250361]
Security context: 0x01658c29d9f1 <JSObject>
    1:  [000001A020368951] [C:\Users\moritz\code\ethereum\urlin-test4\bonding-curve\node_modules\babylon\lib\index.js:~4415] [pc=0000007F8452AB2D](this=0x03fdca333061 <Parser map = 00000248CBED00E1>)
    2:  [000001A020367ED9] [C:\Users\moritz\code\ethereum\urlin-test4\bonding-curve\node_modules\babylon\lib\index.js:~3606] [pc...

FATAL ERROR: Ineffective mark-compacts near heap limit Allocation failed - JavaScript heap out of memory
 1: 00007FF65D76AB9A v8::internal::GCIdleTimeHandler::GCIdleTimeHandler+4810
 2: 00007FF65D710C86 uv_loop_fork+80486
 3: 00007FF65D711BB0 uv_loop_fork+84368
 4: 00007FF65DB8E99E v8::internal::FatalProcessOutOfMemory+798
 5: 00007FF65DB8E8D7 v8::internal::FatalProcessOutOfMemory+599
 6: 00007FF65DE67B54 v8::internal::Heap::RootIsImmortalImmovable+14788
 7: 00007FF65DE5D794 v8::internal::Heap::CollectGarbage+7556
 8: 00007FF65DE5BE68 v8::internal::Heap::CollectGarbage+1112
 9: 00007FF65DE657D7 v8::internal::Heap::RootIsImmortalImmovable+5703
10: 00007FF65DE65856 v8::internal::Heap::RootIsImmortalImmovable+5830
11: 00007FF65DA26341 v8::internal::Factory::NewFillerObject+49
12: 00007FF65E18110A v8::internal::StoreBuffer::StoreBufferOverflow+26826
13: 0000007F84250361
npm ERR! Test failed.  See above for more details.
