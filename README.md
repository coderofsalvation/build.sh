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
1. After scanning `<script>` occurences (using unix grep) it will concatenate the `src=` occurences (as `dist/build.js`).
1. It will then copy `index.html` to `dist/index.html` without those `<script>` occurences

> optional: use `<script nobundle ...>` to skip certain files from being bundled

## Why?

Why not? <br>
Simplicity perhaps?<br>
There's not much microbundlers out there.
