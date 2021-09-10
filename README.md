# Prettier, in Docker

You probably should not use this.

## Purpose

Pocket-size (typically < 60 MB) Docker image, containing only Node.js and Prettier, which you will probably only use in CI environments.

## Warning

Extremely fragile, uses the latest stable Alpine image, packaged Node.js and published Prettier npm package. Extracts dynamically linked Node.js libraries, and rewrites a bit of Prettier on the fly.

## Build

```sh
docker build -t prettier .
```

## Usage

```sh
# Mount the current directory as a volume and run Prettier in every JS file, recursively
docker run -it --rm -w /workspace -v "$PWD:/workspace" prettier --write "**/*.js"
```

## Slimmer image still?

You may delete parsers for TypeScript (about 3.2 MB) or Flow (about 3.0 MB) during the builder phase. Is there really a point, though?

