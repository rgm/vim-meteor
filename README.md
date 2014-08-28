meteor.vim
==========

Maps some basic navigation helpers for [Meteor](http://meteor.com) projects, provided you're following this basic directory structure from the [unofficial FAQ](https://github.com/oortcloud/unofficial-meteor-faq#user-content-where-should-i-put-my-files):

```
├── app
│   ├── client
│   │   ├── hello.html
│   │   ├── hello.js
│   │   ├── main.css
│   │   └── main.html
│   ├── lib
│   │   └── main.js
│   └── server
│       └── main.js
└── test
    └── unit
        ├── client
        │   ├── hello.js
        │   └── main.js
        ├── lib
        │   └── main.js
        └── server
            └── main.js
```

### Templates:

- `<Leader>mt` opens a vsplit with the JavaScript file for the HTML template in
  the current buffer and vice-versa. 
- `<Leader>mT` does the same but without the split.
- `<Leader>mh` opens a vsplit with the HTML template named for the word under the cursor.
- `<Leader>mH` does the same but without the split.

### Unit tests:

- `<Leader>mu` opens a vsplit with the unit test file for the JavaScript file
  in the current buffer and vice-versa.
- `<Leader>mU` does the same but without the split.

Installation
------------

Install [pathogen.vim](https://github.com/tpope/vim-pathogen), then copy and paste:

    cd ~/.vim/bundle
    git clone git://github.com/rgm/vim-meteor.git
