## supafast javascript bundler in ~700 bytes

```sh
$ cd yourjsproject
$ wget 'https://github.com/coderofsalvation/build.sh/raw/master/build.sh'
$ chmod 755 build.sh
$ ./build.sh
$ ls -la dist
index.html
build.js             # profit!
```

## auto-generate documentation

```sh
$ ./build.sh
$ ls reference.md
reference.md         # profit!
```

Function-comments need to contain markdown like this:

```js 
/* myapp.init()
 *
 * initialize-phase (called during startup)
 *
 * **example**:
 * ```
 * // optional: SEARXR.on('init', (init) => init() )
 * SEARXR.init()
 * ```
 */
```

## How it works

1. It expects a `index.html` in the same directory as `build.sh`.<br>
1. After scanning `<script`-occurences (using unix grep) it will concatenate the `src=`-occurences (as `dist/build.js`).
1. It will then copy `index.html` to `dist/index.html` without those `<script`-occurences (except one with `dist/build.js`)

> optional: use `<script nobundle ...>` to skip certain files from being bundled

## Why?

Consider this:

* the chance of somebody reverse engineering your code niche project is overrated 
* debugging code used by less then 1000 users is easier without minification
* you probably don't need zillions of npm modules   
* there's http v2 now, javascript proxies, native imports etc
* simplicity, keep it simple
