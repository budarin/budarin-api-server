#!/usr/bin/env bash

rm -r -f ./build

mkdir ./build

./node_modules/.bin/babel server.js --out-file ./build/server.js

mkdir ./build/libs
./node_modules/.bin/babel ./libs/log.js --out-file ./build/libs/log.js
./node_modules/.bin/babel ./libs/configurePgPool.js --out-file ./build/libs/configurePgPool.js

mkdir ./build/middleware
./node_modules/.bin/babel ./middleware/error.js --out-file ./build/middleware/error.js
./node_modules/.bin/babel ./middleware/logger.js --out-file ./build/middleware/logger.js
./node_modules/.bin/babel ./middleware/routes.js --out-file ./build/middleware/routes.js

NODE_ENV=production node ./build/server.js