#!/usr/bin/env bash

# Bazel fix
unset TMPDIR TMP

ALL_TARGETS=$(bazel query 'kind("rust_(library|binary|proc_macro|test)", //rs/...)')
TARGETS=${1-$ALL_TARGETS}
bazel run @rules_rust//tools/rust_analyzer:gen_rust_project \
  --keep_going -- -- $TARGETS
