#!/bin/bash

# Copyright 2024 The IREE Authors
#
# Licensed under the Apache License v2.0 with LLVM Exceptions.
# See https://llvm.org/LICENSE.txt for license information.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

# Install runtime dependencies for the IREE compiler and runtime.
# Technically we should not need this if we install the IREE python packages
# that describe their dependencies.
# This preinstall will at least speedup subsequent runs.
# If we use the artifacts from IREE's `cmake install` directly then this script
# is required as we would not be using wheels.

set -euo pipefail

python -m pip install --no-cache-dir numpy PyYAML
