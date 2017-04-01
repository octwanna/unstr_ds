! New leo's Bru 2D code (nlb2d). !
! Author: Leonardo Motta
! Contributions: Edson, Andre.

! To do: [ ] -  Put the vector allocations in indat.
        ![ ] -  Perform the area calculation.
        ![ ] -  Find the face inverse.
        ![ ] -  Write formal face data for restart.
        ![ ] -  do a restar procedure.
        ![ ] -  Put some properties in namelist.
        ![ ] -  Put some properties in init 
        ![ ] -  Allocate stuff in init.

program nlb2d

    use shared
    implicit none

    integer(kind=8) :: c1,c2,cr
    real(kind=8) :: rate
    real(kind=8) :: elapse_time

    write(*,'(A)') ""
    write(*,'(A)') "-----------------------------------------------------------"
    write(*,'(A)') "              ++ Euler Unstructured Code ++                "
    write(*,'(A)') "-----------------------------------------------------------"

    ! ----------- Time ------------- 
    call system_clock(count_rate=cr)
    rate = real(cr)
    elapse_time = 0.0d0
    ! ------------------------------

    !
    ! PRE-PROCESSING...
    !

    write(*,'(A)') ""
    write(*,'(A)') "-----------------------------------------------------------"
    write(*,'(A)') " + PERFORMING PRE-PROCESSING."
    
    call system_clock(c1)

    call indat

    call basic_ds

    call hc_faces

    call system_clock(c2)

    elapse_time = real(c2-c1,kind=8)/rate


    write(*,*) ""
    write(*,'(A,F10.6,A)') " + Elapse time: ", elapse_time, " [s]"
    write(*,'(A)') "-----------------------------------------------------------"

    !
    ! BUILDING DERIVED DATA...
    !

    ! ----------- Time ------------- 
    call system_clock(count_rate=cr)
    rate = real(cr)
    elapse_time = 0.0d0
    ! ------------------------------

    write(*,'(A)') ""
    write(*,'(A)') "-----------------------------------------------------------"
    write(*,'(A)') " + BUILDING DERIVED DATA FOR FVM METHOD."

    call system_clock(c1)

    ! Code here man !

    call system_clock(c2)

    elapse_time = real(c2-c1,kind=8)/rate

    write(*,*) ""
    write(*,'(A,F10.6,A)') " + Elapse time: ", elapse_time, " [s]"
    write(*,'(A)') "-----------------------------------------------------------"


end program nlb2d

