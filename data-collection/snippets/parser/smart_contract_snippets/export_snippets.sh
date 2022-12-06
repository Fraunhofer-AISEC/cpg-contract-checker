#!/bin/sh

rm stack_overflow_posts.json
mongoexport --uri="mongodb://sectrs-vascodagama:27017/smart_contract_snippets" --collection stack_overflow_posts --type json --out=stack_overflow_posts.json

rm ethereum_stack_exchange_posts.json
mongoexport --uri="mongodb://sectrs-vascodagama:27017/smart_contract_snippets" --collection ethereum_stack_exchange_posts --type json --out=ethereum_stack_exchange_posts.json
