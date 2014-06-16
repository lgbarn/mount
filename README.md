# mount

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with mount](#setup)
    * [What mount affects](#what-mount-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with mount](#beginning-with-mount)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This module was created to manage filesystem mountpoints for Linux servers. 
It was created to give a resource to manage the lvm and fstab entries and 
mount it in one complete module.

## Module Description

It was created to give a resource to manage the lvm and fstab entries and 
mount it in one complete module. This module only uses modules AlexCline/fstab,
AlexCline/mounts and a few others as dependencies. I will try to remove external
dependencies if and whenever possible.

## Setup

### What mount affects

* This module modifies the /etc/fstab file and will run the mount command.

### Setup Requirements **OPTIONAL**

You should have a extra disk or disks available or have a current volume group available.

### Beginning with mount

The very basic steps needed for a user to get the module up and running.

If your most recent release breaks compatibility or requires particular steps
for upgrading, you may wish to include an additional section here: Upgrading
(For an example, see http://forge.puppetlabs.com/puppetlabs/firewall).

## Usage

  mount::create::mnt_point {"/mymount":
    lvol  => "lvol0",
    vg    => "vg01",
    pvol    => "/dev/sdb",
    size  => "4G",
  }


## Reference

Users should import mount::create class

## Limitations

Tested on Debian and RedHat platforms

## Development

Since your module is awesome, other users will want to play with it. Let them
know what the ground rules for contributing are.

## Release Notes/Contributors/Etc **Optional**

If you aren't using changelog, put your release notes here (though you should
consider using changelog). You may also add any additional sections you feel are
necessary or important to include here. Please use the `## ` header.
