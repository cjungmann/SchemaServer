# Version Notes

The purpose of this document would be more recognizable if it were
named *Release Notes*, but it doesn't seem appropriate name for
new versions of an unreleased product.

## Version 0.76.0069

Tagged on 2018-07-13

- Autoload
- Man files
- Rudimentary testing scripts

### Autoload

The main new feature of this version is an **autoload** feature that
automatically includes the contents of an *autoload.srm* file when it's
found in the same directory as other SRM files.

The inspiration for this feature is a planned wider use of 
[gensfw](https://github.com/cjungmann/gensfw) for generating SRM files
for tables.  The optional but automatic inclusion of a set of shared
modes in *autoload.srm* can make the unmodified output of *gensfw* 
sufficient for production.

### Man files

With growing appreciation of the usefulness of *man* files for C/C++,
BASH scripts, and Linux commands, I decided I would create my own
*man* pages for easier reference.  They are accessed, perhaps somewhat
unintuitively, by `man schema.fcgi` and `man 7 schema.fcgi`.

### Testing scripts

To ensure more testing for new releases, I am starting to write some
scripts for automating several tests.  They should help prevent some
obvious mistakes that I occasionally miss because I neglect to confirm
old features when adding new ones.
