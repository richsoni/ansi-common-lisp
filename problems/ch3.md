1.
  a. [|][-]>[|][-]>[|][nil]
      v      v      v
      a       b    [|][-]>[|][nil]
                    v      v
                    c      d
  b. [|][-]>[|][nil]
      v      v
      a     [|][-]>[|][nil]
             v      v
             b     [|][-]>[|][nil]
                    v      v
                    c     [|][nil]
                           v
                           d
  c. [|][nil]
      v
     [|][-]>[|][nil]
      |      v
      v      d
     [|][-]>[|][nil]
      |      v
      v      c
     [|][-]>[|][nil]
      v      v
      a      b

  d. [|][->][|][|]
      |      |  v
      v      v  d
      a     [|][|]
             v  v
             b  c

2. "union.lisp"
3. "./occurances/occurrences.lisp"
4. Because (members' default truth test is #eql
