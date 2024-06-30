// IMPORT PG
import pg from "pg"

const replaceThis = ""

// CONNECTION STRING
export const db = new pg.Pool({
    connectionString: replaceThis
})