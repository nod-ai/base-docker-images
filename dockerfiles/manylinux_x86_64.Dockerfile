# We build our portable linux releases on the manylinux (RHEL-based)
# images, with custom additional packages installed. We switch to
# new upstream versions as needed.
FROM quay.io/pypa/manylinux_2_28_x86_64@sha256:078fda423323b8483cb8320ac6a0b7c3933d6c332e53225d077ff3186b3ce07e

RUN yum install -y epel-release && \
    yum install -y ccache clang lld && \
    yum install -y capstone-devel tbb-devel libzstd-devel && \
    yum install -y rust cargo && \
    yum clean all && \
    rm -rf /var/cache/yum

######## GIT CONFIGURATION ########
# Git started enforcing strict user checking, which thwarts version
# configuration scripts in a docker image where the tree was checked
# out by the host and mapped in. Disable the check.
# See: https://github.com/openxla/iree/issues/12046
# We use the wildcard option to disable the checks. This was added
# in git 2.35.3
RUN git config --global --add safe.directory '*'
