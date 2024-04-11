# About

Automation for adding DB driver packages to base Apache SuperSet docker image.

Default image comes with ~5 most common SQLAlchemy DB drivers (postgres, mysql etc.).
This repo helps you take that image as the base and, using developer-recommended
approach, add more drivers to the image.

Noting that this produces a new image that you either need to host on your own or
pre-cache into the node that will be running the image and use IfNotPresent download policy for it.

# How

Need unix-like system with working Make.

There are 2 commands in makefile:
- `image` - builds the image and caches it onto build machine's image cache.
- `publish` - runs `image` but also publishes it to image repo based on the full image name specified.

Creating an image locally:

`IMAGE_VERSION=4.0.0 ADDITIONAL_PIP_PACKAGES="trino[sqlalchemy] some-other-db" OUTPUT_IMAGE_NAME=my/superset make image`

Creating and uploading image to repository:

`IMAGE_VERSION=4.0.0 ADDITIONAL_PIP_PACKAGES="trino[sqlalchemy] some-other-db" OUTPUT_IMAGE_NAME=mydockerhubuser/superset make publish`
`IMAGE_VERSION=4.0.0 ADDITIONAL_PIP_PACKAGES="trino[sqlalchemy] some-other-db" OUTPUT_IMAGE_NAME=gcr.io/my/superset make publish`
