// IMPORT PG
import pg from "pg"

const databaseConnection = ""

// CONNECTION STRING
export const db = new pg.Pool({
    connectionString: databaseConnection
})