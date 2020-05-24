============
MCDisp
============

Dispersion curve inversion using Monte Carlo sampling

Installation
--------------

Dependencies
^^^^^^^^^^^^^^

+---------------------------+-------------------------------+
| **Package**               | **Version**                   |
+---------------------------+-------------------------------+
| Pymc3                     | 3.X                           |
+---------------------------+-------------------------------+
| Numpy                     | >= 1.15.0                     |
+---------------------------+-------------------------------+
| Cython                    | >= 0.29.0                     |
+---------------------------+-------------------------------+

Installing
^^^^^^^^^^^^^

.. code-block:: sh
	
	# first clone the repository
   	git clone 'https://github.com/xin2zhang/MCDisp.git'
   	# then install it
    	cd MCDisp
    	python setup.py install
If you want to install it in development mode, so that changes do not require a reinstall
.. code-block:: sh
    python setup.py develop
	

Modal approximation
--------------

The 1d modal approximation code used to compute dispersion curves is from Computer Program in Seismology (CPS, http://www.eas.slu.edu/eqc/eqccps.html).
This code provides a Python interface for the original Fortran code.

.. code-block:: 

Examples
----------

Please look through examples in the examples folder and two jupyter-notebooks: `Variational_Tomo2d.ipynb <https://github.com/xin2zhang/VarTomo/blob/master/examples/Variational_Tomo2d.ipynb>`__ and `VariationalFWI.ipynb <https://github.com/xin2zhang/VarTomo/blob/master/examples/VariationalFWI.ipynb>`__.
