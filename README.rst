============
MCDisp
============

Surface wave dispersion curve inversion using Monte Carlo sampling

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
This package provides a Python interface for the original Fortran code.
To use this code,

.. code-block::

    fromp pydisp import disp
    phase = (thk,vp,vs,rho,freqs,modetype=1,phasetype=0,dc=1e-3)
    # thk, vp, vs, rho are 1D arrays with same size
    # freqs is a 1D array of frequencies
    # modetype: 1 for Rayleigh wave, 0 for Love wave
    # phasetype: 1 for group velocity, 0 for phase velocity
    # dc is the searching spacing for phase velocity

Examples
----------

Please look through examples in the examples folder and two jupyter-notebooks: `Dispersion.ipynb <https://github.com/xin2zhang/MCDisp/blob/master/examples/Dispersion.ipynb>`__.
