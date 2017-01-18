# swap-php-valet
A bash command to swap PHP versions for Laravel Valet, using Hombrew.

# Requirements
- Homebrew
- PHP
- Laravel Valet

# Installation
Add this script to your `.bash_profile` or import it using your own method.

# Usage

```bash
# PHP 5.6
phpswap 56

# PHP 7.0
phpswap 70
```

It basically matches the PHP version, among the version you have installed (`brew list` to double check).

# Known issue
For some reason, even though we start the PHP service as the current user, it somehow swaps (_oh, the irony!_) it to the `root` user. That means, the service will be started as root. This is something we take care of when stopping each service.
