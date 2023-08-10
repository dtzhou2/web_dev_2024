#!/bin/bash
# Step 1: Install buildah

sudo dnf install buildah

# Step 2: Get a sense for how buildah works

buildah containers
buildah images
buildah help
buildah show

# Step 3: Pull the base image from quay

builadh pull quay.io/centos/centos:stream8

# Step 4: Create container for base image

buildah from --name $CONTAINER_NAME $BASE_IMAGE

# Step 5: Run base ansible playbook against base image

ansible-playbook /path/to/playbook -c buildah

# Step 6: Modify ansible playbook until it works properly

# Step 7: Create an account on quay

# Step 8: Commit your container locally

buildah commit $CONTAINER_NAME $NEW_IMAGE_NAME


# Step 9: Setup quay on your machine

# Enable passwords and enabled encrypted passwords
buildah login quay.io
buildah commit $CONTAINER_NAME quay.io/$USERNAME/$NEW_IMAGE_NAME
buildah push quay.io/$USERNAME/$NEW_IMAGE_NAME