#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd "$DIR/../.."

. ./manifest
. "$DIR/_base.sh"

set -e 

# --------------------------------------------------------------------------------
# GENERATION
# --------------------------------------------------------------------------------

# ----------------------------------------
# COLLECTION OF THE OPERATOR BUNDLE FILES
# - entando-operator-config

echo "> Collecting the deployment files"

mkdir -p "$D/ge-1-1-6"

# NAMESPACE SCOPED DEPLOYMENT

cp -a -R \
  "$T/$REPO_OPERATOR_BUNDLE_DIR/manifests/k8s-before-116/namespace-scoped-deployment/" \
  "$D/ge-1-1-6/namespace-scoped-deployment"
  
rm "$D/ge-1-1-6/namespace-scoped-deployment/all-in-one.yaml"

# CLUSTER SCOPED DEPLOYMENT

cp -a -R \
  "$T/$REPO_OPERATOR_BUNDLE_DIR/manifests/k8s-116-and-later/cluster-scoped-deployment" \
  "$D/ge-1-1-6/cluster-scoped-deployment"

# SAMPLES

echo "> Collecting the samples"

cp -a -R \
  "$T/$REPO_OPERATOR_BUNDLE_DIR/samples/" \
  "$D/ge-1-1-6/samples"

