# basesystem

#### Table of Contents

1. [Description](#description)
1. [Usage - Configuration options and additional functionality](#usage)

## Description

Simple module to standardize base system. The goal is mostly to provide 
a functionnal minimal standard for site specific cusomizations.
What it does :
 * Add bash completion
 * Configure date and time in bash logs
 * Standardize /etc/hosts
 * Add nscd
 * Deploy an NTP server
 * Add standard packages

## Usage

node 'master' {
    include basesystem
