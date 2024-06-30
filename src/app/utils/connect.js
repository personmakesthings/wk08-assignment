// IMPORT PG
import pg from "pg"

// CONNECTION STRING
export const db = new pg.Pool({
    connectionString: REPLACE
})