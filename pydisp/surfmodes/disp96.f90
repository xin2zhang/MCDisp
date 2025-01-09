module m_disp
    use iso_c_binding, only : c_double, c_int

    implicit none

contains
    subroutine disp96(thick, vp, vs, rho, freqs, modetype, phasetype, dc, phase)
        use m_surfmodes, only: surfmodes, T_MODES_PARA
        implicit none
        real(kind=c_double), dimension(:), intent(in) :: thick
        real(kind=c_double), dimension(:), intent(in) :: vp
        real(kind=c_double), dimension(:), intent(in) :: vs
        real(kind=c_double), dimension(:), intent(in) :: rho
        real(kind=c_double), dimension(:), intent(in) :: freqs
        integer(c_int), intent(in) :: modetype, phasetype
        real(kind=c_double), intent(in) :: dc
        real(kind=c_double), dimension(:), intent(out) :: phase

        type(T_MODES_PARA) :: paras
        real(kind=c_double), dimension(:), allocatable :: pvel, gvel
        integer :: nfreqs, ierr

        nfreqs = size(freqs)
        allocate( pvel(nfreqs), gvel(nfreqs) )
        pvel = 0
        gvel = 0

        paras%modetype = modetype
        paras%phaseGroup = phasetype
        paras%tolmin = 1E-6
        paras%tolmax = 1E-5
        paras%smin_min = 1E-3
        paras%smin_max = 5E-3
        paras%dc = dc
        paras%dcm = dc
        paras%dc1 = dc
        paras%dc2 = dc

        call surfmodes(thick, vp, vs, rho, freqs, paras, pvel, gvel, ierr)

        phase = 0
        if(phasetype==0)then
            phase = pvel
        else
            phase = gvel
        endif
        if(ierr==1)then
            phase = 0
        endif

    end subroutine

    subroutine c_disp96(n, thick, vp, vs, rho, nf, freqs, modetype, phasetype, dc, phase) bind(c)
        integer(c_int), intent(in) :: n, nf
        real(kind=c_double), dimension(n), intent(in) :: thick
        real(kind=c_double), dimension(n), intent(in) :: vp
        real(kind=c_double), dimension(n), intent(in) :: vs
        real(kind=c_double), dimension(n), intent(in) :: rho
        real(kind=c_double), dimension(nf), intent(in) :: freqs
        integer(c_int), intent(in) :: modetype, phasetype
        real(kind=c_double), intent(in) :: dc
        real(kind=c_double), dimension(nf), intent(out) :: phase

        call disp96(thick,vp,vs,rho,freqs,modetype,phasetype,dc,phase)

    end subroutine

end module
