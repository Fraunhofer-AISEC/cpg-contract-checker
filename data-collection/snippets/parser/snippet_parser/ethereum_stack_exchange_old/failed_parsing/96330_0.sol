2021-03-28T14:19:46Z [ERROR] Operation failed                                   migrations/0003_eth_logs_table.go:66 elapsed=0.425989 err=ERROR: syntax error at or near "INCLUDE" (SQLSTATE 42601) rows=0 sql=
    CREATE TABLE "eth_logs" (
        "id" BIGSERIAL PRIMARY KEY,
        "block_hash" bytea NOT NULL,
        "block_number" bigint NOT NULL,
        "index" bigint NOT NULL,
        "address" bytea NOT NULL,
        "topics" bytea[] NOT NULL,
        "data" bytea NOT NULL,
        "order_received" serial NOT NULL,
        "created_at" timestamp without time zone NOT NULL
    );

    CREATE UNIQUE INDEX idx_eth_logs_unique ON eth_logs (block_hash, index) INCLUDE (id);
    CREATE INDEX IF NOT EXISTS idx_eth_logs_block_number ON eth_logs (block_number);
    CREATE INDEX IF NOT EXISTS idx_eth_logs_address_block_number ON eth_logs (address, block_number);

        ALTER TABLE log_consumptions RENAME CONSTRAINT chk_log_consumptions_exactly_one_job_id TO chk_log_broadcasts_exactly_one_job_id;
        ALTER TABLE log_consumptions RENAME CONSTRAINT log_consumptions_job_id_fkey TO log_broadcasts_job_id_fkey;
        ALTER TABLE log_consumptions RENAME TO log_broadcasts;

    ALTER TABLE log_broadcasts
        ADD COLUMN "consumed" BOOL NOT NULL DEFAULT FALSE,
                ADD COLUMN "eth_log_id" BIGINT, -- NOTE: This ought to be not null in the final application of this migration
                ADD CONSTRAINT log_broadcasts_eth_log_id_fkey FOREIGN KEY (eth_log_id) REFERENCES eth_logs (id) ON DELETE CASCADE DEFERRABLE INITIALLY IMMEDIATE;

    CREATE INDEX idx_log_broadcasts_unconsumed_eth_log_id ON log_broadcasts (eth_log_id) WHERE consumed = false;
    CREATE INDEX idx_log_broadcasts_unconsumed_job_id ON log_broadcasts (job_id) WHERE consumed = false AND job_id IS NOT NULL;
    CREATE INDEX idx_log_broadcasts_unconsumed_job_id_v2 ON log_broadcasts (job_id_v2) WHERE consumed = false AND job_id_v2 IS NOT NULL;

        DROP INDEX IF EXISTS log_consumptions_unique_v1_idx;
        DROP INDEX IF EXISTS log_consumptions_unique_v2_idx;

        CREATE UNIQUE INDEX log_consumptions_unique_v1_idx ON log_broadcasts(job_id, block_hash, log_index) INCLUDE (consumed) WHERE job_id IS NOT NULL;
        CREATE UNIQUE INDEX log_consumptions_unique_v2_idx ON log_broadcasts(job_id_v2, block_hash, log_index) INCLUDE (consumed) WHERE job_id_v2 IS NOT NULL;
 stacktrace=github.com/smartcontractkit/chainlink/core/store/migrations.init.2.func1
        /Users/casper.local/Desktop/CL-EA-NodeJS-Template/chainlink/core/store/migrations/0003_eth_logs_table.go:66
github.com/go-gormigrate/gormigrate/v2.(*Gormigrate).runMigration
        /Users/casper.local/go/pkg/mod/github.com/go-gormigrate/gormigrate/v2@v2.0.0/gormigrate.go:364
github.com/go-gormigrate/gormigrate/v2.(*Gormigrate).migrate
        /Users/casper.local/go/pkg/mod/github.com/go-gormigrate/gormigrate/v2@v2.0.0/gormigrate.go:198
github.com/go-gormigrate/gormigrate/v2.(*Gormigrate).MigrateTo
        /Users/casper.local/go/pkg/mod/github.com/go-gormigrate/gormigrate/v2@v2.0.0/gormigrate.go:151
github.com/smartcontractkit/chainlink/core/store/migrations.MigrateUp
        /Users/casper.local/Desktop/CL-EA-NodeJS-Template/chainlink/core/store/migrations/migrate.go:25
github.com/smartcontractkit/chainlink/core/store/migrations.Migrate
        /Users/casper.local/Desktop/CL-EA-NodeJS-Template/chainlink/core/store/migrations/migrate.go:11
github.com/smartcontractkit/chainlink/core/store.initializeORM.func1
        /Users/casper.local/Desktop/CL-EA-NodeJS-Template/chainlink/core/store/store.go:279
github.com/smartcontractkit/chainlink/core/store/orm.(*ORM).RawDBWithAdvisoryLock
        /Users/casper.local/Desktop/CL-EA-NodeJS-Template/chainlink/core/store/orm/orm.go:1561
github.com/smartcontractkit/chainlink/core/store.initializeORM
        /Users/casper.local/Desktop/CL-EA-NodeJS-Template/chainlink/core/store/store.go:278
github.com/smartcontractkit/chainlink/core/store.newStoreWithKeyStore
        /Users/casper.local/Desktop/CL-EA-NodeJS-Template/chainlink/core/store/store.go:92
github.com/smartcontractkit/chainlink/core/store.NewStore
        /Users/casper.local/Desktop/CL-EA-NodeJS-Template/chainlink/core/store/store.go:70
github.com/smartcontractkit/chainlink/core/services/chainlink.NewApplication
        /Users/casper.local/Desktop/CL-EA-NodeJS-Template/chainlink/core/services/chainlink/application.go:136
github.com/smartcontractkit/chainlink/core/cmd.ChainlinkAppFactory.NewApplication
        /Users/casper.local/Desktop/CL-EA-NodeJS-Template/chainlink/core/cmd/client.go:86
github.com/smartcontractkit/chainlink/core/cmd.(*Client).RunNode
        /Users/casper.local/Desktop/CL-EA-NodeJS-Template/chainlink/core/cmd/local_client.go:58
github.com/urfave/cli.HandleAction
        /Users/casper.local/go/pkg/mod/github.com/urfave/cli@v1.22.5/app.go:524
github.com/urfave/cli.Command.Run
        /Users/casper.local/go/pkg/mod/github.com/urfave/cli@v1.22.5/command.go:173
github.com/urfave/cli.(*App).RunAsSubcommand
        /Users/casper.local/go/pkg/mod/github.com/urfave/cli@v1.22.5/app.go:405
github.com/urfave/cli.Command.startApp
        /Users/casper.local/go/pkg/mod/github.com/urfave/cli@v1.22.5/command.go:372
github.com/urfave/cli.Command.Run
        /Users/casper.local/go/pkg/mod/github.com/urfave/cli@v1.22.5/command.go:102
github.com/urfave/cli.(*App).Run
        /Users/casper.local/go/pkg/mod/github.com/urfave/cli@v1.22.5/app.go:277
main.Run
        /Users/casper.local/Desktop/CL-EA-NodeJS-Template/chainlink/core/main.go:20
main.main
        /Users/casper.local/Desktop/CL-EA-NodeJS-Template/chainlink/core/main.go:14
runtime.main
        /usr/local/go/src/runtime/proc.go:203 
creating application: failed to initialize ORM: initializeORM#Migrate: ERROR: syntax error at or near "INCLUDE" (SQLSTATE 42601)
