import numpy as np
cimport numpy as np

cdef extern from "pydisp.h":
    void c_disp96(int *n, double *thick, double *vp, double *vs, double *rho, int *, double *freqs, int *modetype, int *phasetype, double *dc, double *phase)
    void disp96(double *thick, double *vp, double *vs, double *rho, double *freqs, int *modetype, int *phasetype, double *dc, double *phase)


def disp(np.ndarray[double, ndim=1, mode="c"] thick not None,
        np.ndarray[double, ndim=1, mode="c"] vp not None,
        np.ndarray[double, ndim=1, mode="c"] vs not None,
        np.ndarray[double, ndim=1, mode="c"] rho not None,
        np.ndarray[double, ndim=1, mode="c"] freqs not None,
        int modetype=1, int phasetype=0, double dc=1e-3):
    ''' Compute dispersion curves using modal approximation method.
        thick    : 1d array of thickness
        vp       : 1d array of P-wave velocity
        vs       : 1d array of S-wave velocity
        rho      : 1d array of density
        freqs    : 1d array of frequencies for which phase/group velocity will be computed
        modetype : 1 for Rayleigh wave, 0 for Love wave
        phasetype: 1 for group velocity, 0 for phase velocity
        dc       : the spacing of phase velocity which is used to search phase velocities 
    '''

    cdef int n = thick.shape[0]
    cdef int nfreqs = freqs.shape[0]
    cdef np.ndarray[double, ndim=1, mode="c"] phase = np.empty(nfreqs,dtype=np.float64)

    c_disp96(&n, &thick[0], &vp[0], &vs[0], &rho[0], &nfreqs, &freqs[0], &modetype, &phasetype, &dc, &phase[0])

    return phase
