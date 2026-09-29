#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
OUT="${TMPDIR:-/tmp}/cf_cmp_ct_tb"
iverilog -g2005 -o "$OUT" \
  "$ROOT/hdl/gl/CF_CMP_CT.v" \
  "$ROOT/verify/beh_model/CF_CMP_CT_core.v" \
  "$ROOT/verify/beh_model/tb_CF_CMP_CT.v"
vvp "$OUT"
