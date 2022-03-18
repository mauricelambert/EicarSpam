use std::fs;

fn main() -> std::io::Result<()> {
    let eicar = format!(
        "{}EICAR-STANDARD-ANTIVIRUS-TEST-FILE{end}",
        "X5O!P%@AP[4\\PZX54(P^)7CC)7}$",
        end="!$H+H*"
    );

    for x in 0..301 {
        fs::write(
            format!("test{}.txt", x), eicar.clone()
        )?;
    }

    Ok(())
}