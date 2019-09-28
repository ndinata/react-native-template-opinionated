#!/usr/bin/env node

const { execSync } = require('child_process');

// initialise git repo for the package
execSync('git init');
