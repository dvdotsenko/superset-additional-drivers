BASE_IMAGE?=apache/superset

# override as:
#  IMAGE_VERSION=4.0.0 make image
IMAGE_VERSION?=latest

# override as:
#  ADDITIONAL_PIP_PACKAGES="package[add] another" make image
ADDITIONAL_PIP_PACKAGES?=trino[sqlalchemy]
# on some systems may replace with 'sudo docker' or packer etc
DK:=docker

# override as"
#  IMAGE_VERSION=4.0.0 OUTPUT_IMAGE_NAME=mydockerhubuser/superset make publish
OUTPUT_IMAGE_NAME?=my/superset

image:
	${DK} build -f Dockerfile . \
		--build-arg="BASE_IMAGE=${BASE_IMAGE}"
		--build-arg="IMAGE_VERSION=${IMAGE_VERSION}" \
		--build-arg="ADDITIONAL_PIP_PACKAGES=${ADDITIONAL_PIP_PACKAGES}" \
		-t ${OUTPUT_IMAGE_NAME}:${IMAGE_VERSION}


publish: image
	${DK} push ${OUTPUT_IMAGE_NAME}:${IMAGE_VERSION}
