VERSION=0.2.0
RELEASE_DIR=$(pwd)/bosh-releases
TARBALL=nginx-oauth2-boshrelease-${VERSION}.tgz
bosh create-release --name=nginx-oauth2 --force --version=${VERSION} --final --tarball=${RELEASE_DIR}/${TARBALL}
bosh upload-blobs

cat <<EOF > manifests/versions.yml
nginx_oauth2_version: ${VERSION}
nginx_oauth2_sha1: $(sha1sum ${RELEASE_DIR}/${TARBALL} | awk '{print $1}')
EOF
