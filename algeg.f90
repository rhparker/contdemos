
SUBROUTINE FUNC(NDIM,U,ICP,PAR,IJAC,F,DFDU,DFDP)
!     ---------- ----

! Evaluates the algebraic equations or ODE right hand side

! Input arguments :
!      NDIM   :   Dimension of the ODE system 
!      U      :   State variables
!      ICP    :   Array indicating the free parameter(s)
!      PAR    :   Equation parameters

! Values to be returned :
!      F      :   ODE right hand side values

! Normally unused Jacobian arguments : IJAC, DFDU, DFDP (see manual)

IMPLICIT NONE
INTEGER NDIM, IJAC, ICP(*)
INTEGER I, J, K
DOUBLE PRECISION U(NDIM), PAR(*), F(NDIM), DFDU(*), DFDP(*)
DOUBLE PRECISION G(NDIM)
DOUBLE PRECISION C,L,S,M,B

      L = PAR(1)
      C = PAR(2)

      F(1) = (U(1)**2 - 1)*(U(1)**2 - 4) + L*(U(1)**2)*EXP(C*U(1))

END SUBROUTINE FUNC
!----------------------------------------------------------------------
!----------------------------------------------------------------------

SUBROUTINE STPNT(NDIM,U,PAR,T)
!     ---------- -----

! Input arguments :
!      NDIM   :   Dimension of the ODE system 

! Values to be returned :
!      U      :   A starting solution vector
!      PAR    :   The corresponding equation-parameter values

      IMPLICIT NONE
      INTEGER NDIM
      DOUBLE PRECISION U(NDIM), PAR(*), T
      DOUBLE PRECISION C, L
      DOUBLE PRECISION IMPLICIT

! Initialize the equation parameters
      PAR(1)=0                ! L
      PAR(2)=0.1              ! C
      
      U(1) = 1

END SUBROUTINE STPNT

!----------------------------------------------------------------------
!----------------------------------------------------------------------
! The following subroutines are not used here,
! but they must be supplied as dummy routines

SUBROUTINE BCND 
END SUBROUTINE BCND

SUBROUTINE ICND 
END SUBROUTINE ICND

SUBROUTINE FOPT 
END SUBROUTINE FOPT

SUBROUTINE PVLS
END SUBROUTINE PVLS
!----------------------------------------------------------------------
!----------------------------------------------------------------------
