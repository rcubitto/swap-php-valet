# swap-php-valet
A bash command to swap PHP versions for Laravel Valet, using Hombrew.

Inspired by [this](https://dyrynda.com.au/blog/switching-php-versions-with-laravel-valet)  tutorial by [Michael Dyrynda](https://twitter.com/michaeldyrynda)

# Requirements
- Homebrew
- PHP
- Laravel Valet

# Installation
Add this script to your `.bash_profile` or import it using your own method. 

You may download the script directly running `curl -O https://raw.githubusercontent.com/rcubitto/swap-php-valet/master/swap_php_valet.sh`

# Usage

```bash
# PHP 5.6
phpswap 56

# PHP 7.0
phpswap 70
```

It basically matches the PHP version, among the version you have installed (`brew list | grep php` to double check).

# Known issue
For some reason, even though we start the PHP service as the current user, it somehow swaps it to the `root` user (_oh, the irony!_). That means, the service will be started as root. This is something we take care of when stopping each service.
