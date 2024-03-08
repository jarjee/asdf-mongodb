#!/usr/bin/env bash
# shellcheck disable=SC2046

shellcheck --shell=bash --external-sources \
	bin/* --source-path=template/lib/ \
	lib/* \
	scripts/*

shfmt --language-dialect bash --diff \
	$(shfmt -f . | grep -v lib/m)
