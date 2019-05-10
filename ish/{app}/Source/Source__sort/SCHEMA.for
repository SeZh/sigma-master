C ���� SCHEMA.for
C �������� ������������ SCHEMA
C ===================================================================
C ������������ ���������� �������������� ���������������� ���������� ����� ��������
C � ������������ ����� ��������
C ������� ������:
C ������� ����������� � ���������������� ���������� �����
C DIAG � ������ �������� �������� ������������ ��������� �������
C �NV � ������ �������� �������������� �������� �������
C XENV � ��������� ������
C SIZ � ������ �������
C ===================================================================
C ================ ������ ���� TRANSFORMATION =================================
C ===================================================================

      subroutine SCHEMA (DIAG, ENV, XENV, SIZ)

      REAL LN2, LNZ3, DIAG3
      INTEGER XENV1
      INTEGER XENV, CIP2, RI2, NZ3, NZSUB3, XNZSUB3, XL2, NZ2, PD,XLNZ3
      DIMENSION DIAG(1),ENV(1),XENV(1)
      DIMENSION TMP(1000000)
      DIMENSION SCHEMA1(10000)
      DIMENSION VE2(10000),RI2(10000),CIP2(10000)
      DIMENSION VE3(10000),LD3(10000)
      DIMENSION VE(10000), PD(10000)
      DIMENSION BAND(10000,10000)
      DIMENSION DIAG2(10000),NZ2(10000),LN2(10000),XL2(10000)
      DIMENSION DIAG3(10000),LNZ3(10000),XLNZ3(10000),NZSUB3(10000)
      DIMENSION XNZSUB3(10000),NZSUBtmp(10000)
      DIMENSION DIAG1(10000), ENV1(10000), XENV1(10000)
      INTEGER k,l,m,n,BANDSIZ
      INTEGER SIZ
      INTEGER row_number, col_number
      INTEGER iln,nullInVe
C �������������:
C ������ TMP - ��� ������������� ������� � ���� ������� ������
C ������ SCHEMA1 - ��� ������������� ������� � ���� ����� 1
C ������� VE2, RI2, CIP2 - ��� ������������� ������� � ���� ����� 2
C ������� VE3 � LD3 - ��� ������������� ������� � ���� ����� 3
C ������� DIAG3, XLNZ3, NZSUB3,NZSUBtmp, XNZSUB3, LNZ3 - ��� ������������� � ���� ���������� �����.
C ������� DIAG2, NZ2, LN2, XL2 - ��� ������������� � ���� ������� �����
C ������ BAND ��� ������������� � ���� ������������ �����. BANDSIZ - ��������������� ���������� ��� ������ ������� �������
C ������� VE � PD - ��� ������������� ���������� �����


C ��������� ������� ������
      do i= 1, SIZ
      do j= 1, SIZ
      TMP((i-1)*SIZ+j)=0
      enddo
      enddo

C ��������� ������������ ��������
      do i = 1, SIZ
      TMP((i-1)*SIZ+i)=DIAG(i)
      enddo

C ��������������� ������� �� XENV � ENV
      do i= 1,SIZ
      J1 = XENV(I)
      J2=XENV(I+1)-1
      IF(J2.GE.J1) then
      do j= J1,J2
      TMP((i-1)*SIZ + i - J2+j-1) = ENV(j)
      enddo
      endif
      enddo

C ����� ���� �������������� � ����� �������� 1
      k=1;
      do col_number = 1, SIZ
      SCHEMA1(k)=0
      k=k+1
      SCHEMA1(k) = col_number
      k=k+1
        do row_number = 1, SIZ
          if (abs(TMP((row_number-1)*SIZ+col_number)).gt.0) then
            SCHEMA1(k) = row_number
            k=k+1
            SCHEMA1(k) = TMP((row_number-1)*SIZ+col_number)
            k=k+1
          endif
        enddo
      enddo
      SCHEMA1(k)=0
      k=k+1
      SCHEMA1(k)=0

C ����� � ����
      WRITE(6,*)
      WRITE(6,110)
110   FORMAT ("******����� �������� 1*****")
      WRITE(6,*) "����� ��������� ��������� = ", (k/2)-1-SIZ
      WRITE(6,*) "����� ������� ������ = ", k

C ����� ���� �������������� � ����� 2
      k=1
      do col_number = 1, SIZ
      CIP2(col_number)=k
      do row_number = 1, SIZ
      if (abs(TMP((row_number-1)*SIZ + col_number)).gt.0.0005) then
      VE2(k) = TMP((row_number-1)*SIZ + col_number)
      RI2(k) = row_number
      k=k+1
      endif
      enddo
      enddo
      k=k-1

C ����� ���� ����� ������� � ���� ����� 2
      WRITE(6,*)
      WRITE(6,210)
210   FORMAT ("******����� �������� 2*****")
      WRITE(6,*) "������� ������ �� ������ VE = ", k
      WRITE(6,*) "������� ������ �� ������ RI = ", k
      WRITE(6,*) "������� ������ �� ������ CIP = ", SIZ
      WRITE(6,*) "����� ������� ������ = ", SIZ+k*2

C ����� ���� �������������� � ����� 3
      k=1
      do col_number = 1,SIZ
        do row_number = 1,SIZ
        if (abs(TMP((row_number-1)*SIZ + col_number)).gt.0.0005)then
          VE3(k)=TMP((row_number-1)*SIZ + col_number)
          LD3(k)= row_number + (col_number-1)*SIZ
          k=k+1
        endif
      enddo
      enddo
      k=k-1
C ����� � ����
      WRITE(6,*)
      WRITE(6,310)
310   FORMAT ("******����� �������� 3*****")
      WRITE(6,*) "������� ������ �� ������ VE = ", k
      WRITE(6,*) "������� ������ �� ������ LD = ", k
      WRITE(6,*) "����� ������� ������ = ", k*2

C ����� ���� �������������� � ���������� �����
      k=1  ! ������� � LNZ3
      m=0  ! ������� � NZSUB3
      n=0  ! ������� � XNZSUB3
      im_old=0
      iln=0 ! ����� ��������� ��������� ������� LN
      do col_number=1,SIZ
      if(col_number.ne.SIZ) then
        XLNZ3(col_number)=k
      endif
      l=0
      ! m_delta - �������� �� NZSUB3 ��� ������� �� ������� ����
      ! m_old - ������� m ����� ����������� ������ �������
      im_delta= m-im_old
      im_old=m
      do row_number=col_number,SIZ
        if(col_number.eq.row_number) then
          DIAG3(col_number)=TMP((row_number-1)*SIZ + col_number)
      else if (ABS(TMP((row_number-1)*SIZ + col_number)).gt.0.005)then
      LNZ3(k)=TMP((row_number-1)*SIZ + col_number)
      iln=iln+1
      m=m+1
      NZSUB3(m)=row_number
      k=k+1
      l=1
      endif
      enddo
      isame=0  ! ���� ���������� ���������������������� ������� ��������
      if(col_number.lt.SIZ) then
      if(m-im_old.eq.im_delta) then
      isame=1
      ! ���� � ���� ��������� �������� ���������� ����� ��������� ���������
      ! ��������� �� �������� �������
      do i= im_old-im_delta+1,im_old
        if (NZSUB3(i).ne.NZSUB3(i+im_delta)) then
          ! ���� ��������������������� �� ������� - ������ �� ������
          isame=0
          goto 212
        endif
      ENDDO
      if (isame.eq.1) then
          ! ���� ������� - �������������� NZSUB3, �������� ��������� ����������� ��������
        do j=1,im_old
          NZSUBtmp(j)=NZSUB3(j)
        ENDDO
        NZSUB3=NZSUBtmp
        ! ���������� �������� �� ������� ���������� ���������
        m=im_old
        im_old=m-im_delta
      endif
212       endif
        endif
        n=n+1
        if(n.eq.1)   then
          XNZSUB3(n) = 1
        else if(isame.eq.1) then
          ! ���� ��������������������� ������� - ���������� ���������� ������
          XNZSUB3(n) =   XNZSUB3(n-1)
        else
    ! ����� ���������� ������ ������ �������
      XNZSUB3(n) = im_old+1
      endif

      if (l.eq.0) then
        if(col_number.ne.SIZ) then
          LNZ3(k)=0
          k=k+1
        endif
      endif
      enddo

C ����� � ����
      WRITE(6,410)
410   FORMAT ("******���������� ����� ��������*****")
      WRITE(6,*)
      WRITE(6,*) "������ DIAG= ", SIZ
      WRITE(6,*) "������ LNZ= ", k-1
      WRITE(6,*) "����� ��������� ��������� LNZ= ", iln
      WRITE(6,*) "������ XLNZ= ", SIZ-1
      WRITE(6,*) "������ NZSUB= ", m
      WRITE(6,*) "������ XNZSUB= ", n
      i=n+k-2+m+(SIZ*2)
      WRITE(6,*) "����� ������� ������ = ", i
      WRITE(6,*)

C ����� ���� �������������� � ������� �����
      k=1
      iln=0 ! ����� ��������� ��������� ������� LN
      do col_number=1,SIZ
        XL2(col_number)=k
        l=0
        do row_number=col_number,SIZ
          if(col_number.eq.row_number) then
            DIAG2(col_number)=TMP((row_number-1)*SIZ + col_number)
      else if (ABS(TMP((row_number-1)*SIZ + col_number)).gt.0.005)then
        LN2(k)=TMP((row_number-1)*SIZ + col_number)
        iln=iln+1
        NZ2(k)=row_number
        k=k+1
        l=1
      endif
      enddo

      if (l.eq.0) then
        LN2(k)=0
        if(col_number.ne.SIZ) then
        NZ2(k) = NZ2(k-1)
        k=k+1
      endif
      endif
      enddo
C ����� � ����
      WRITE(6,*)
      WRITE(6,510)
510   FORMAT ("******������� ����� ��������*****")
      WRITE(6,*) "������ ������� DIAG = ", SIZ
      WRITE(6,*) "����� ��������� ��������� ������� LN = ", iln
      WRITE(6,*) "����� ������� ������ = ", (k-1)+k + SIZ*2

C ����� ���� �������������� � ���������� �����
      k=1
      nullInVe = 0
      do row_number = 1,SIZ
        do col_number= 1,row_number
          if (((abs(TMP((row_number-1)*SIZ + col_number)).gt.0.005))
     &.and.(col_number.ne.row_number)) then
       VE(k)=TMP((row_number-1)*SIZ + col_number)
       k=k+1
       do l = col_number+1, row_number
         VE(k)=TMP((row_number-1)*SIZ + l)
         if(ABS(VE(k)).LT.0.005) nullInVe = nullInVe +1
         k=k+1
       enddo
       PD(row_number)=k-1
       goto 131
      else if (col_number.eq.row_number) then
        VE(k) = TMP((row_number-1)*SIZ + col_number)
        PD(row_number)=k
        k=k+1
      else
      endif
      enddo
131   enddo
      k=k-1
C ����� � ����
      WRITE(6,*)
      WRITE(6,610)
610   FORMAT ("******���������� ����� ��������*****")
      WRITE(6,*) "������ VE =", k
      WRITE(6,*) "����� ��������� ��������� � ������� VE =",k-nullInVe
      WRITE(6,*) "������ PD =", SIZ
      WRITE(6,*) "����� ������� ������ = ", k + SIZ

C ����� ���� �������������� � ������������ �����
      k=1
      BANDSIZ = 1;
      iln=0
      DO row_number=2, SIZ
        DO col_number=1, row_number
          if(( abs(TMP((row_number-1)*SIZ + col_number)).gt.0.005)
     &.and.(BANDSIZ.le.(row_number-col_number))) then
      BANDSIZ = row_number-col_number
      endif
      ENDDO
      ENDDO
      do row_number=1,SIZ
        do col_number=1,BANDSIZ+1
          BAND(col_number,row_number) =
     &TMP((row_number-1)*SIZ + row_number-BANDSIZ+col_number-1)
      if((row_number-1)*SIZ + row_number-BANDSIZ+col_number-1.lt.0)
     & BAND(col_number,row_number) = 0
      if(abs(BAND(col_number,row_number)).lt.0.005) then
        iln=iln+1
      endif
      enddo
      enddo
C ����� � ����
      WRITE(6,*)
      WRITE(6,710)
710   FORMAT ("******������������ ����� ��������*****")
      WRITE(6,*) "������ ����� = ", BANDSIZ
      WRITE(6,*) "����� ��������� ���������  = ", SIZ*(BANDSIZ+1)-iln
      WRITE(6,*) "����� ������� ������ = ", SIZ*(BANDSIZ+1)

C ����� ���� �������������� � ���������������� ���������� �����
      do row_number=1,SIZ
        DIAG1(row_number) = TMP((row_number-1)*SIZ + row_number)
      enddo
      iln=0;
      k=1
      do row_number = 1, SIZ
        XENV1(row_number)=k
        do col_number = 1, row_number-1
          if ((abs(TMP((row_number-1)*SIZ + col_number)).gt.0.005)
     &.and.(col_number.ne.row_number)) then
      do l = col_number,row_number-1
        ENV1(k)=TMP((row_number-1)*SIZ + l)
        if(abs(ENV1(k)).lt.0.005) iln = iln+1
        k=k+1
      enddo
      goto 153
      endif
      enddo
153    enddo
      XENV1(SIZ+1)=k
      k=k-1

C ����� � ����
      WRITE(6,*)
      WRITE(6,810)
810   FORMAT ("******���������������� ���������� ����� ��������*****")
      WRITE(6,*) "����� ��������� ��������� ENV = ",k-iln
      WRITE(6,*) "������ ENV =", k
      WRITE(6,*) "������ XENV =", SIZ+1
      WRITE(6,*) "������ DIAG =", SIZ
      WRITE(6,*) "����� ������� ������ = ",SIZ*2+k+1

      RETURN
      END
