## supafast javascript bundler in ~500 bytes

```sh
$ cd yourjsproject
$ wget 'https://github.com/coderofsalvation/build.sh/raw/master/build.sh'
$ chmod 755 build.sh
$ ./build.sh
$ ls -la dist
index.html
build.js             # profit!
```

## How it works

1. It expects a `index.html` in the same directory as `build.sh`.<br>
1. After scanning `<script src` occurences (using unix grep) it will concatenate the `src=` occurences (as `dist/build.js`).
1. It will then copy `index.html` to `dist/index.html` without those `<script src` occurences (except one with `dist/build.js`)

> optional: use `<script nobundle ...>` to skip certain files from being bundled

## Why?

Consider this: 

* java*script* a *scripting* language.<br>

> Doesn't make any sense? Then consider wikipedia's explanation: _"A scripting language .... without the need for the user to have intimate knowledge of the inner workings of the application or to rebuild it after each tweak"_
 
