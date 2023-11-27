---
title: Rust Script Shebang
description: 
published: true
date: 2023-11-27T05:09:56.228Z
tags: 
editor: markdown
dateCreated: 2023-11-26T17:35:58.546Z
---

# Rust Script Shebang
> This section requires [enabling flakes](/nix/experimental_features#enabling-flakes).

For users of Nix who have enabled the experimental features `flakes` and `nix-command`, one cool trick to write simple `rust-script` files is the following.

```rust
#!/usr/bin/env -S nix run nixpkgs#rust-script

fn main() {
  println!("Hello, Nix!");
}
```

Remember that you'll have to make the file executable to run it. If the file is named `hello.rs`, you'd have to run:

```bash
chmod +x hello.rs
```

And then to run the script:

```bash
./hello.rs
```

## Running Tests

This can be incorporated into larger rust scripts like e.g. in this example for solving the leetcode problem of counting digit divisors.

```rust
#!/usr/bin/env -S nix run nixpkgs#rust-script -- --test
fn digits(num: usize) -> impl Iterator<Item = u32> {
    num.to_string()
        .chars()
        .map(|d| d.to_digit(10).unwrap())
        .collect::<Vec<_>>()
        .into_iter()
}

pub fn count_digits(num: i32) -> i32 {
    let digits = num.to_string().chars().map(|d| d.to_digit(10).unwrap() as i32).collect::<Vec<i32>>();
    let mut res: i32 = 0;
    for d in &digits {
        if num%d == 0 {
            res += 1;
        }
    }
    return res;
}

fn main() {
    println!("7: {}", count_digits(7));
    println!("121: {}", count_digits(121));
    println!("1248: {}", count_digits(1248));
}

#[cfg(test)]
mod tests {
    use crate::count_digits;
    #[test]
    fn it_works() {
        assert!(count_digits(7)==1);
        assert!(count_digits(121)==2);
        assert!(count_digits(1248)==4);
    }
}
```