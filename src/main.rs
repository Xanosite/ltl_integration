use mysql::{Opts, OptsBuilder};

pub mod function_test;

fn connections_test() -> mysql::Result<(u16, u16, u16), mysql::Error> {
    let fb_prod_clone_opts: Opts = Opts::from(OptsBuilder::new()
        .ip_or_hostname(Some("66.243.252.59"))
        .tcp_port(3308)
        .user(Some("fishbowl"))
        .pass(Some("Level20Fishbowl"))
        .db_name(Some("prod_clone")));
    function_test::database::conn_check(fb_prod_clone_opts)
}

fn main() {
    println!("{:?}", connections_test().unwrap())
}