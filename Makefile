# Copyright 2022 The Prometheus Authors
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Needs to be defined before including Makefile.common to auto-generate targets
DOCKER_ARCHS ?= amd64
DOCKER_REPO  ?= prometheuscommunity

include Makefile.common

STATICCHECK_IGNORE =

DOCKER_IMAGE_NAME ?= smartctl-exporter

.PHONY: container-binary
container-binary: promu
	@echo ">> building linux/amd64 binary for container image"
	GOOS=linux GOARCH=amd64 CGO_ENABLED=0 $(PROMU) build \
		--prefix $(PREFIX)/.build/linux-amd64 $(PROMU_BINARIES)

.PHONY: image
image: container-binary
	$(MAKE) docker DOCKERBUILD_CONTEXT="--load ."
