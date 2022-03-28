use std::fs;

#[no_mangle]
pub extern fn eicar(x: i32) -> i32 {
    let eicar = format!(
        "{}EICAR-STANDARD-ANTIVIRUS-TEST-FILE{end}",
        "X5O!P%@AP[4\\PZX54(P^)7CC)7}$",
        end="!$H+H*"
    );

    for x in 0..x {
        fs::write(
            format!("test{}.txt", x), eicar.clone()
        );
    }

    return 0;
}