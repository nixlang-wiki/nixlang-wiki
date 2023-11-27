---
title: Developing Kernenl Modules with Nix
description: 
published: true
date: 2023-11-27T11:43:52.704Z
tags: 
editor: markdown
dateCreated: 2023-11-27T11:43:52.704Z
---

# Developing Kernel Modules
The Linux Kernel allows inserting so called "kernel modules". These can be anything, including drivers, network filters, or something more silly, like a [kernel level rickroll](https://github.com/fpletz/kernelroll).

Most users won't have to write their own kernel module, but at least a few will be interested. This gives a very basic idea of how to do that on NixOS.

## Example Kernel Module - hello_nix
Let's say we just wrote a very simple kernel module, that prints `Hello, Nix!` periodically in the `dmesg` log. The code is the following, stored in a file called `hello_nix.c`.

```c
/* Licensed under AGPLv3 - Christina Sørensen 2023 */
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/timer.h>
#include <linux/random.h>

#define MODULE_NAME "hello_nix"

MODULE_LICENSE("AGPL v3");

static struct timer_list hello_timer;

unsigned random_ticket;

void hello_timer_callback(struct timer_list *t) {
    printk(KERN_INFO "Hello, NixOS!\n");
    get_random_bytes(&random_ticket, sizeof random_ticket);
    random_ticket = 1u + (random_ticket % 7u);
    hello_timer.expires = jiffies + HZ*random_ticket*10;
    add_timer(&hello_timer);
}

static int __init hello_init(void)
{
    printk(KERN_INFO "hello_nix: Starting the hello_nix module\n");
    timer_setup(&hello_timer, hello_timer_callback, 0);
    hello_timer.expires = jiffies + HZ*10;
    add_timer(&hello_timer);
    printk(KERN_NOTICE "hello_nix: Initialized the hello_nix module!\n");
    return 0;
}

static void __exit hello_exit(void) {
    del_timer_sync(&hello_timer);
    printk(KERN_INFO "hello_nix: Removing the hello_nix module\n");
}

module_init(hello_init);
module_exit(hello_exit);
```

Now, we can just create a `Makefile` that looks like this.

```makefile
TARGET=hello_nix
obj-m += $(TARGET).o
LINUX_VERSION = linux_6_5

all:
    make -C $(shell nix-build -E '(import <nixpkgs> {}).$(LINUX_VERSION).dev' --no-out-link)/lib/modules/*/build M=$(shell pwd) modules
ins:
    sudo insmod $(TARGET).ko
rm:
    sudo rmmod $(TARGET).ko
clean:
    rm Module.symvers
    rm modules.order
    rm hello_nix.o
    rm hello_nix.ko
    rm hello_nix.mod
    rm hello_nix.mod.c
    rm hello_nix.mod.o
    rm .modules.order.cmd
    rm .Module.symvers.cmd
    rm .hello_nix.ko.cmd
    rm .hello_nix.mod.cmd
    rm .hello_nix.mod.o.cmd
    rm .hello_nix.o.cmd
dmesg:
    dmesg --ctime --color=auto --follow
```

