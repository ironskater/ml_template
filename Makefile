.PHONY: all clean

IRIS_URL = "https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data"
MNIST_URL = "https://storage.googleapis.com/tensorflow/tf-keras-datasets/mnist.npz"
RAW_DATA = "data/00_raw/iris.csv"

CONDA_ENV_YML = environment.yml
ENV_NAME = mltmp
MNIST = data/00_raw/mnist.npz

#all: env
env:
	conda env create -f $(CONDA_ENV_YML) -n $(ENV_NAME)
	conda env config vars set PYTHONPATH=$(PWD)/src -n $(ENV_NAME)
	@echo PYTHONPATH=$(PWD)/src > dev.env

mnist:
ifeq ("$(wildcard $(MNIST))", "")
	python src/main/data/raw.py $(MNIST_URL) $(MNIST)
else
	@echo "Data has exitsted"
endif

clean:
	rm -f data/00_raw/*.npz

# data/00_raw/mnist.npz:
# 	python src/main/data/raw.py $(MNIST_URL) $@