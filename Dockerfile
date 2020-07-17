# Tools necessary for applying terraform google asm module
# The Google ASM module requires gcloud, kubectl, kpt and kustomize,
# in addition to terraform.

ARG TERRAFORM_VERSION=0.12.28
ARG CLOUD_SDK_VERSION=300.0.0

FROM hashicorp/terraform:$TERRAFORM_VERSION AS terraform

FROM google/cloud-sdk:${CLOUD_SDK_VERSION}-alpine
RUN gcloud components install kubectl kpt kustomize
COPY --from=terraform /bin/terraform /usr/local/bin/terraform 
LABEL org.label-schema.url="https://github.com/jafcrocker/gcloud-terraform-asm" \
      org.label-schema.description="Tools for provisioning Google ASM via terraform"
