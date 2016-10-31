# Crosswalk-builder

[![Build Status](https://travis-ci.org/lekoder/crosswalk.svg?branch=master)](https://travis-ci.org/lekoder/crosswalk)

Build crosswalk apps in container. Supported platforms:

* Android

# Usage

## Create sample project:
```bash
docker run --rm -it -v $(pwd)/test:/app koder/crosswalk-builder crosswalk-app create com.example.test
```

## Build android project:
```bash
docker run --rm -it -v $(pwd)/test:/app koder/crosswalk-builder crosswalk-pkg build com.example.test/app
```