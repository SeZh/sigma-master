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

      REAL LN2, LNZ3, DIAG3, tmp1, tmp2
      INTEGER XENV1
      INTEGER XENV, CIP2, RI2, NZ3, NZSUB3, XNZSUB3, XL2, NZ2, PD,XLNZ3
      DIMENSION DIAG(1),ENV(1),XENV(1)
      DIMENSION TMP(100000)
      DIMENSION SCHEMA1(10000)
      DIMENSION VE2(10000),RI2(10000),CIP2(10000)
      DIMENSION VE3(10000),LD3(10000)
      DIMENSION VE(10000), PD(10000)
      DIMENSION BAND(10000,10000)
      DIMENSION DIAG2(10000),NZ2(10000),LN2(10000),XL2(10000)
      DIMENSION DIAG3(10000),LNZ3(10000),XLNZ3(10000),NZSUB3(10000)
      DIMENSION XNZSUB3(10000),NZ3(10000)
      DIMENSION DIAG1(10000), ENV1(10000), XENV1(10000)
      INTEGER k,l,m,n,BANDSIZ
      INTEGER SIZ
      INTEGER row_number, col_number
      INTEGER nzsubsize, xnzsubsize,iln,nullInVe
C �������������:
C ������ TMP - ��� ������������� ������� � ���� ������� ������
C ������ SCHEMA1 - ��� ������������� ������� � ���� ����� 1
C ������� VE2, RI2, CIP2 - ��� ������������� ������� � ���� ����� 2
C ������� VE3 � LD3 - ��� ������������� ������� � ���� ����� 3
C ������� DIAG3, XLNZ3, NZSUB3, XNZSUB3, LNZ3 - ��� ������������� � ���� ���������� �����. NZ3 - ��������������� ������ ��� ���������� ���������� ����� (������������ ���������� ������� NZ2 � ������� �����)
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
      WRITE(6,*) "������� ������ = ", k
      WRITE(6,*) "����� ��������� ��������� = ", (k/2)-1-SIZ

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
      WRITE(6,*) "����� ������� ������ = ", SIZ+k*2
      WRITE(6,*) "������� ������ �� ������ VE = ", k
      WRITE(6,*) "������� ������ �� ������ RI = ", k
      WRITE(6,*) "������� ������ �� ������ CIP = ", SIZ

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
      WRITE(6,*) "����� ������� ������ = ", k*2
      WRITE(6,*) "������� ������ �� ������ VE = ", k
      WRITE(6,*) "������� ������ �� ������ LD = ", k

C ����� ���� �������������� � ���������� �����
      k=1
      do col_number=1,SIZ
      XLNZ3(col_number)=k
      l=0
      do row_number=col_number,SIZ
      if(col_number.eq.row_number) then
      DIAG3(col_number)=TMP((col_number-1)*SIZ +row_number)
      else if (abs(TMP((col_number-1)*SIZ + row_number))
     &.gt.0.005) then
      LNZ3(k)=TMP((col_number-1)*SIZ + row_number)
      NZ3(k)=row_number
      k=k+1
      l=1
      endif
      enddo
      if (l.eq.0) then
      LNZ3(k)=0
      NZ3(k)=NZ3(k-1)
      k=k+1
      endif
      enddo
      k=k-2

      XNZSUB3(1) = 1
      nzsubsize=k-1
      do i=1,k
        NZSUB3(i)=NZ3(i)
      enddo
      m=1
      do i = 1, SIZ
        l=0
        do j=i,SIZ
          if (j.gt.i+1) then
            tmp1=TMP((j)*SIZ + i)
            tmp2=TMP((j)*SIZ + i+1)
          else
            tmp1=0
            tmp2=0
          endif
          if ((tmp1.gt.0.005).and.(tmp2.gt.0.005)) then
          else if ((tmp1.lt.0.005).and.(tmp2.lt.0.005)) then
          else
            l=1
          endif
        enddo
        if (l.eq.1)then
          XNZSUB3(m)=XLNZ3(i)
          m=m+1
        else
          if (m.gt.1) then
            XNZSUB3(m)=XNZSUB3(m-1)
          endif
          m=m+1
          do n=1,k-XLNZ3(j)
            NZSUB3(n)=NZSUB3(n+1)
          enddo
          if (XLNZ3(i+1).ne.0) then
            nzsubsize=nzsubsize-(XLNZ3(i+1)-XLNZ3(i))
          endif
        endif
      enddo
      k=k-1
        i=nzsubsize+(SIZ*3)+(k*2)

C ����� � ����
      WRITE(6,410)
410   FORMAT ("******���������� ����� ��������*****")
      WRITE(6,*) "NOT DONE"
      WRITE(6,*) "������� ������ = ", i
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
        NZ2(k) = NZ2(k-1)
        k=k+1
      endif
      enddo
      k=k-1
C ����� � ����
      WRITE(6,*)
      WRITE(6,510)
510   FORMAT ("******������� ����� ��������*****")
      WRITE(6,*) "������� ������ = ", (k-1)+k + SIZ*2
      WRITE(6,*) "������ ������� DIAG = ", SIZ
      WRITE(6,*) "����� ��������� ��������� ������� LN = ", iln

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
      WRITE(6,*) "������� ������ = ", k + SIZ

C ����� ���� �������������� � ������������ �����
      k=1
      BANDSIZ = 1;
      iln=0
      DO row_number=2, SIZ
        DO col_number=1, row_number
          if(( TMP((row_number-1)*SIZ + col_number).ne.0)
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
      WRITE(6,*) "������� ������ = ", SIZ*(BANDSIZ+1)
      WRITE(6,*) "������ ����� = ", BANDSIZ
      WRITE(6,*) "����� ��������� ���������  = ", SIZ*(BANDSIZ+1)-iln

C ����� ���� �������������� � ���������������� ���������� �����
      do row_number=1,SIZ
        DIAG1(row_number) = TMP((row_number-1)*SIZ + row_number)
      enddo
      iln=0;
      k=1
      XENV1(1)=1
      do row_number = 1, SIZ
        XENV1(row_number)=k
        do col_number = 1, row_number
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
      WRITE(6,*) "����� ������� ������ = ",SIZ*2+k+1

      RETURN
      END
