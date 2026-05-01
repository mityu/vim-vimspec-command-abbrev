# vimspec-command-abbrev.vim

This plugin provides some abbreviations to make it easy to write vimspec testsuites.
This plugin expands lowercased themis.vim's helper commands (`:h themis-helper-command`) into CamelCased command names.  E.g.:

```
describe          --->  Describe
before            --->  Before
assert            --->  Assert
expect            --->  Expect
Assert equals     --->  Assert Equals
Assert throws     --->  Assert Throws
Expect tobetrue   --->  Expect ToBeTrue

etc...
```
