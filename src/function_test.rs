/// Doc test 1
pub mod database {
    /// Doc test 2
    use mysql::{Opts, Pool, Result};

    pub fn conn_check(opts: Opts) -> Result<(u16, u16, u16), mysql::Error> {
        let pool = Pool::new(opts)?;
        let conn = pool.get_conn()?;
        Ok(conn.server_version())
    }
}