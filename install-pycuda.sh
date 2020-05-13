# To make sure nvcc is found
# CUDA VERSION: 10.0 

export PATH=/usr/local/cuda-10.0/bin${PATH:+:${PATH}}$ 
export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

# Install pycuda
sudo pip3 install 'pycuda>=2019.1.1'