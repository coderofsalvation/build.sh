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

* developers in general like building simple, tiny pet-projects
* developers in general don't like premature optimization 
* there's http v2 now, javascript proxies, native imports etc
* the chance of somebody reverse engineering your niche project is overrated 
* the chance of somebody reverse engineering your opensource project is weird 
* a big upside of scripting languages is the absence of a buildstep 
* you probably don't need zillions of npm modules   
* simplicity, keep it simple
