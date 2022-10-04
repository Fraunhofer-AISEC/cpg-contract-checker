<--- Last few GCs --->

[12580:00000272FA68BBB0]  2415158 ms: Scavenge 2037.4 (2083.5) -> 2036.6 (2093.7) MB, 16.0 / 0.0 ms  (average mu = 0.627, current mu = 0.267) allocation failure
[12580:00000272FA68BBB0]  2419309 ms: Mark-sweep (reduce) 2043.9 (2094.0) -> 2040.8 (2083.0) MB, 3300.9 / 0.2 ms  (+ 576.9 ms in 109 steps since start of marking, biggest step 41.6 ms, walltime since start of marking 3910 ms) (average mu = 0.458, current

<--- JS stacktrace --->

FATAL ERROR: Reached heap limit Allocation failed - JavaScript heap out of memory
 1: 00007FF7CA6EE3EF v8::internal::CodeObjectRegistry::~CodeObjectRegistry+111951
 2: 00007FF7CA67DA36 v8::internal::WebSnapshotDeserializer::context_count+65446
 3: 00007FF7CA67E8ED node::OnFatalError+301
 4: 00007FF7CAFBA78E v8::Isolate::ReportExternalAllocationLimitReached+94
 5: 00007FF7CAFA540D v8::SharedArrayBuffer::Externalize+781
 6: 00007FF7CAE27F0C v8::internal::Heap::EphemeronKeyWriteBarrierFromCode+1468
 7: 00007FF7CAE25242 v8::internal::Heap::CollectGarbage+3778
 8: 00007FF7CAE22D95 v8::internal::Heap::AllocateExternalBackingStore+1909
 9: 00007FF7CAE461B1 v8::internal::Factory::NewFillerObject+209
10: 00007FF7CAB75D35 v8::internal::DateCache::Weekday+1349
11: 00007FF7CB042B11 v8::internal::SetupIsolateDelegate::SetupHeap+472849
12: 00007FF7CB043A58 v8::internal::SetupIsolateDelegate::SetupHeap+476760
13: 00007FF7CB098722 v8::internal::SetupIsolateDelegate::SetupHeap+824098
14: 00007FF7CB036D14 v8::internal::SetupIsolateDelegate::SetupHeap+424212
15: 0000027280792239
error Command failed with exit code 134.
info Visit https:
