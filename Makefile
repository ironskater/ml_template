.PHONY: env clean test

CONDA_ENV_YML = environment.yml
ENV_NAME = solar_anomaly_detection

env:
ifeq ($(shell conda env list| grep $(ENV_NAME)),)
	@echo Start install virtual env: $(ENV_NAME)
	@conda env create -f $(CONDA_ENV_YML) -n $(ENV_NAME)
	@conda env config vars set PYTHONPATH=$(PWD)/src -n $(ENV_NAME)
else
	@read -p "Virtual env[$(ENV_NAME)] is existed. Do you want to update it? [y/n]:" yesno && \
	if [ "y" = $$yesno ]; then \
		conda env update -f $(CONDA_ENV_YML) -n $(ENV_NAME); \
	else \
		echo "Nothing to be updated"; \
	fi
endif
	@if [ ! -f "dev.env" ]; then echo PYTHONPATH=$(PWD)/src > dev.env;fi

clean:
	rm -f data/00_example/*

test:
