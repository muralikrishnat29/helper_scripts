# Step 1: Clone ONNXRuntime Repo and checkout a particular branch for stable branch
git clone --recursive https://github.com/Microsoft/onnxruntime
cd onnxruntime
git checkout b783805

# Step 2: Export NVCC Path
export CUDACXX="/usr/local/cuda/bin/nvcc"

# Step 3: Important Step - Modilfy the contents as given below
'''
Modify  tools/ci_build/build.py
    - "-Donnxruntime_DEV_MODE=" + ("OFF" if args.android else "ON"),
    + "-Donnxruntime_DEV_MODE=" + ("OFF" if args.android else "OFF"),
Modify cmake/CMakeLists.txt
    -  set(CMAKE_CUDA_FLAGS "${CMAKE_CUDA_FLAGS} -gencode=arch=compute_50,code=sm_50") # M series
    +  set(CMAKE_CUDA_FLAGS "${CMAKE_CUDA_FLAGS} -gencode=arch=compute_53,code=sm_53") # Jetson support
'''

# Step 4: Finally Build the library
./build.sh --config Release --update --build --build_wheel --use_tensorrt --cuda_home /usr/local/cuda --cudnn_home /usr/lib/aarch64-linux-gnu --tensorrt_home /usr/lib/aarch64-linux-gnu

# Steo 5: Install the built package and install pip package
# Navigate into built package i.e. build/Linux and install
