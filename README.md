```
.
├── README.md <--- project description
├── environment.yml <--- Used for creating a new conda env
├── Makefile <--- Control project lifecycle, use 'make train', 'make test', or 'make data' etc to do it
├── model <--- Store model, .pickle or .h5
├── data <--- Store data in different pipeline stages. This folder is ignored by git
│   └── 00_example
├── notebook
│   └── dnn.ipynb
├── report <--- reports of each model's performances, and experimental condition etc
│   ├── dnn
│   └── cnn
└── src
	├── main
	|	├── __init__.py
	|	├── data <--- data pipeline script
	|	│   ├── __init__.py
	|	│   └── raw.py
	|	├── model <--- final model script, let us easy to reproduce model train/prediction by make tool
	|	│   ├── __init__.py
	|	│   ├── hyperparam <--- store model's hyperparameter
	|	│   ├── cnn.py
	|	│   └── dnn.py
	|	└── analysis <--- analysis scirpt such as visulaization for model performances, data distribution etc
	|		└── __init__.py
	|
	├── test
	|
	└── utility
	    ├── __init__.py
	    └── logger.py
```