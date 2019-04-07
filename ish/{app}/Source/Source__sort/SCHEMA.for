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
      INTEGER nzsubsize, xnzsubsize      
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
      print*, i,TMP((i-1)*SIZ+i), DIAG(i)

      enddo
 
C ������ - �����) ��������������� ������� �� XENV � ENV
 
      do i= 1,SIZ
      J1 = XENV(I)
      J2=XENV(I+1)-1
      
      IF(J2.GE.J1) then

      do j= J1,J2
      
      TMP((i-1)*SIZ + i - J2+j-1) = ENV(j)       
      
!      print *, i,j,ENV(J2+j-1),TMP((i)*SIZ-j)
      
      
      enddo
      
      endif
      
      enddo


      print*, "********************"

            do i = 1, SIZ
      print*, i,TMP((i-1)*SIZ+i), DIAG(i)
      enddo




C ����� ���� �������������� � ����� �������� 1

      k=1;
      do i = 1, SIZ
      SCHEMA1(k)=0
      k=k+1
      SCHEMA1(k) = i
      k=k+1
      do j = 1, SIZ

      if (abs(TMP((i-1)*SIZ+j)).gt.0) then 
      SCHEMA1(k) = j
      k=k+1
      SCHEMA1(k) = TMP((i-1)*SIZ+j)
      k=k+1
      endif
      enddo
      enddo
      SCHEMA1(k)=0
      k=k+1
      SCHEMA1(k)=0
      
      i=0
C ����� ���������� �������������� � ����
      WRITE(6,110) 
110   FORMAT ("******����� �������� 1*****")
      
      
      do while (i.lt.k) 
      
      
      i=i+1
      
      IF (abs(SCHEMA1(i)).le.0.0005) then
      
      WRITE(6,111) SCHEMA1(i)
111   FORMAT ("|",(f12.1),"|")
      
      Else 
      
      do while (abs(SCHEMA1(i)).ge.0.0005)
      WRITE(6,112) SCHEMA1(i),SCHEMA1(i+1)
112   FORMAT ("|",(f12.3),"|"(f12.0),"|")
      i=i+2
      enddo
      
      endif
      
      enddo
      WRITE(6,111) SCHEMA1(i+1)
      WRITE(6,*)
      WRITE(6,*) "������� ������ = ", k*2





C ����� ���� �������������� � ����� 2
      k=1
      do i = 1, SIZ
      CIP2(i)=k
      do j = 1, SIZ

      if (abs(TMP((i-1)*SIZ + j)).gt.0.0005) then 
      VE2(k) = TMP((i-1)*SIZ + j)
      RI2(k) = j
      k=k+1
      endif
      enddo
      enddo
      k=k-1
C ����� ���� ����� ������� � ���� ����� 2


      WRITE(6,210) 
210   FORMAT ("******����� �������� 2*****")

      WRITE(6,*)
      WRITE(6,211)
211   FORMAT (" |   I   |  CIP  |    RI    |     VE     |") 
      do i=1,k
      if (i.lt.SIZ) then
      WRITE(6,212) i, CIP2(i),RI2(i),VE2(i)
212   FORMAT (" |",i7,"|",i7,"|",i10,"|",f12.3)
      else
      WRITE(6,213) i,RI2(i),VE2(i)
213   FORMAT (" |",i7,"|       |",i10,"|",f12.3)
      endif
      enddo

      WRITE(6,*)
      WRITE(6,*) "������� ������ = ", SIZ+k*3




C ����� ���� �������������� � ����� 3

      k=1
      do i = 1,SIZ
      do j = 1,SIZ

      if (abs(TMP((i-1)*SIZ + j)).gt.0.0005)then
      VE3(k)=TMP((i-1)*SIZ + j)
      LD3(k)= j + (i-1)*SIZ
      k=k+1
      endif
      enddo
      enddo
      k=k-1
C ����� � ����
      WRITE(6,310) 
310   FORMAT ("******����� �������� 3*****")

      WRITE(6,*)
      WRITE(6,311)
311   FORMAT (" |   I   |    LD    |     VE     |") 
      do i=1,k
      WRITE(6,312) i, LD3(i),VE3(i)
312   FORMAT (" |",i7,"|",i10,"|",f12.3)
      enddo
      WRITE(6,*)
      WRITE(6,*) "������� ������ = ", k*3




C ����� ���� �������������� � ���������� �����
      k=1

      
 
      do i=1,SIZ
      XLNZ3(i)=k    
      l=0
      do j=i,SIZ
      if(i.eq.j) then
      DIAG3(i)=TMP((i-1)*SIZ + j)
      else if (abs(TMP((j-1)*SIZ + i)).gt.0.005) then
      LNZ3(k)=TMP((j-1)*SIZ + i)
      NZ3(k)=j
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
      
      XNZSUB3(1) = 1
      nzsubsize=k
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
!      print*,nzsubsize
      WRITE(6,410) 
410   FORMAT ("******���������� ����� ��������*****")

      WRITE(6,*)
      WRITE(6,411)
411   FORMAT(" |   I   |   DIAG    |    LN Z    |XL NZ|NZ SUB|XN ZSUB|")

      
      
      do i=1,k
      if (i.lt. SIZ)  then
      WRITE(6,412) i, DIAG3(i),LNZ3(i), XLNZ3(i), NZSUB3(i), XNZSUB3(i)
412   FORMAT (" |",i7,"|",f11.3,"|",f12.3,"|",i5,"|",i6,"|",i7,"|")
      
      else if (i.lt.nzsubsize) then
  
      WRITE(6,413) i, LNZ3(i), NZSUB3(i) 
413   FORMAT (" |",i7,"|           |",f12.3,"|     |",i6,"|       |")
      else 

      WRITE(6,414) i, LNZ3(i)
414   FORMAT (" |",i7,"|           |",f12.3,"|     |      |       |")      
  
      endif
           
      enddo
      WRITE(6,*)
      WRITE(6,*) "������� ������ = ", SIZ*4+k*2+nzsubsize
      WRITE(6,*)

      


C ����� ���� �������������� � ������� �����
      k=1

      do i=1,SIZ
      XL2(i)=k
      l=0
      do j=i,SIZ
      if(i.eq.j) then
      DIAG2(i)=TMP((i-1)*SIZ + j)
      else if (abs(TMP((j-1)*SIZ + i)).gt.0.005) then
      
      LN2(k)=TMP((j-1)*SIZ + i)
      NZ2(k)=j
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
      WRITE(6,510) 
510   FORMAT ("******������� ����� ��������*****")
      WRITE(6,*)
      WRITE(6,511)
511   FORMAT (" |   I   |    DIAG    |   NZ  |     LN     |  XL   |")
      do i = 1,k-1
      if (i.le.SIZ) then

      WRITE(6,512) i, DIAG2(i),NZ2(i), LN2(i), XL2(i) 
512   FORMAT (" |",i7,"|", f12.3 ,"|",i7"|", f12.3 ,"|",i7,"|")
      else
      WRITE(6,513) i, NZ2(i), LN2(i)
513   FORMAT (" |",i7,"|            |",i7"|",f12.3,"|       |")
      endif
    
      enddo

      WRITE(6,*) "������� ������ = ", (k-1)*3 + SIZ*3
      
      
      
      
C ����� ���� �������������� � ���������� �����
      k=1
      do i = 1,SIZ
      do j= 1,i
      if (((abs(TMP((i-1)*SIZ + j)).gt.0.005)).and.(i.ne.j)) then
      VE(k)=TMP((i-1)*SIZ + j)
      PD(i)=k 
      k=k+1
      do l = j, i
      VE(k)=TMP((i-1)*SIZ + l)
      k=k+1 
      enddo
      goto 131
      else if (i.eq.j) then
      VE(k) = TMP((i-1)*SIZ + j)
      PD(i)=k 
      k=k+1
      else 
      endif
      enddo
131   enddo
      k=k-1

      WRITE(6,610) 
610   FORMAT ("******���������� ����� ��������*****")
      WRITE(6,*)
      WRITE(6,611)
611   FORMAT (" |   I   |     VE     |   PD  |")
      do i=1,k
      if (i.le.SIZ) then
      WRITE(6,612) i,VE(i),PD(i)
612   FORMAT (" |",i7,"|",f12.3,"|",i7,"|")
      else      
      WRITE(6,613) i,VE(i)
613   FORMAT (" |",i7,"|",f12.3,"|       |")
      endif
      enddo
      WRITE(6,*)
      WRITE(6,*) "������� ������ = ", k*2 + SIZ
      


C ����� ���� �������������� � ������������ �����

      k=1
      BANDSIZ = 1
      DO i=2, SIZ
      DO j=1, i
       if (( TMP((i-1)*SIZ + j).ne.0).and.(BANDSIZ.le.(SIZ-j))) then
         BANDSIZ = SIZ - j
            endif
      ENDDO
      ENDDO

      do i=1,SIZ
      do j=BANDSIZ,1,-1
            BAND(i,BANDSIZ-j+1) = TMP((i-1)*SIZ + j)
      enddo
      enddo


      WRITE(6,710) 
710   FORMAT ("******������������ ����� ��������*****")
      WRITE(6,*)
      do i=1, SIZ
      write(6,711) (BAND(i,j) ,j=1,BANDSIZ)
      enddo
711   FORMAT (10000("|",f10.1) )
      WRITE(6,*) "������� ������ = ", SIZ*BANDSIZ*2




C ����� ���� �������������� � ���������������� ���������� �����
      
      do i=1,SIZ
      DIAG1(i) = TMP((i-1)*SIZ + i)
      enddo

      k=1
      XENV1(1)=1
      ENV1(1)=0
      XENV1(2)=1
      do i = 1, SIZ
      XENV1(i)=k
      do j = 1, i
      
      if (((abs(TMP((i-1)*SIZ + j)).gt.0.005)).and.(i.ne.j)) then

      
      do l = j, i-1
      ENV1(k)=TMP((i-1)*SIZ + l)
      k=k+1 
      enddo
      goto 151
      endif
      enddo
      ENV1(k)=0
      k=k+1      
151   l=l

      enddo
      XENV1(SIZ+1)=k
      k=k-1
      WRITE(6,810) 
810   FORMAT ("******���������������� ���������� ����� ��������*****")
      WRITE(6,*)
      WRITE(6,811)
811   FORMAT (" |   I   |    DIAG    |     ENV    | XENV  |")
      
      do i=1,k
      if (i.le.SIZ) then
      WRITE(6,812) i,DIAG1(i),ENV1(i),XENV1(i)
812   FORMAT (" |",i7,"|",f12.3,"|",f12.3,"|",i7,"|")
      else if (i.le.SIZ+1) then
      WRITE(6,813) i,ENV1(i),XENV1(i)
813   FORMAT (" |",i7,"|            |",f12.3,"|",i7,"|")

      else
      WRITE(6,814) i,ENV1(i)
814   FORMAT (" |",i7,"|            |",f12.3,"|       |")
      endif
      
      
      enddo
      WRITE(6,*)
      WRITE(6,*) "������� ������ = ", k*2 + SIZ*2 + SIZ+1


      
      

      RETURN
      END
