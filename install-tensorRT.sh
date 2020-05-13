##TensorRT Installation
'''
PRE-REQUISITES:
This is under the assumption that the Jetson Nano being used has Ubuntu 18.04 OS and CUDA 10.0
Installation requires tensorrt DEBIAN Package from the following link
https://developer.nvidia.com/compute/machine-learning/tensorrt/secure/7.0/7.0.0.11/local_repo/nv-tensorrt-repo-ubuntu1804-cuda10.0-trt7.0.0.11-ga-20191216_1-1_amd64.deb
This download might require a registration followed by login (might have to reclick the above link if not logged in)
'''
# Add ARM64 architecture to install the TensorRT Debian Package
sudo dpkg --add-architecture arm64

# Install the debian package
os=”ubuntu1804”
tag=”cuda10.0-trt7.0.0.11-ga-20191216”
sudo dpkg -i nv-tensorrt-repo-${os}-${tag}_1-1_amd64.deb
sudo apt-key add /var/nv-tensorrt-repo-${tag}/7fa2af80.pub

sudo apt-get update
sudo apt-get install tensorrt

# Install the additional package
sudo apt-get install python3-libnvinfer-dev

# Verify the installation Package
sudo dpkg -l | grep TensorRT