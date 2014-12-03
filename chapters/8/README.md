# Summary
1. Any string can be the name of a symbol, but symbols created by read are transformed into uppercase by default.
2. Symbols have associated property lists, which behave like assoc-lists, though they don't have the same form.
3. Symbols are substantial objects, more like structures than mere names.
4. Packages map strings to symbols. To create an entry for a symbol in a package is to intern it. Symbols do not have to be interned.
5. Packages enforce modularity by restricting which names you can re- fer to. By default your programs will be in the user package, but larger programs are often divided into several packages defined for that purpose.

# Literal Symbols
Putting pipes around a symbol makes it literal ```|``` .
*All Macro Characters will be ignored!!!!*
e.g.

```
> (list '|LISP 1.5| '|| '|abc| '|ABC|)
(|Lisp 1.5| || |abc| ABC)
```    

# Property Lists

```
> (get 'alizarin 'color)
NIL
> (setf 'alizarin 'color) 'red)
RED
> (get 'alizarin 'color)
RED
> (symbol-plist 'alizarin)
(COLOR RED)
```

# Symbol Data Structure (Pretty Big)

Name: "FOO"
package: -> pkg
value: 27
function: #<function>
plist: (color red)

# Packages

symbol-tables
(symbol-name) -> symbol

Symbols are *interned* into a package

Default Package is ```common-lisp-user```

## Export Example

```
(defpackage "MyApplication"
  (:use "COMMON-LISP" "MY-UTILITIES")
  (:nicknames "APP")
  (:export "WIN" "LOSE" "DRAW"))
(in-package my-application)
```

Load always resets the current package back when it is complete!!!!

# Keywords

short for ```keyword:name```

Work in any package!!!

Symbols must be exported, but keywords work everywhere


