C ���� PRNTDD.FOR
C �������� ������������ PRNTDD(� ������� �� 8000 �����)
C ================================================================
C ������������ ������������� ��� ������ ������ ������� ��������� � 
C ������� ��� ������� �����:��������� ������ ������ ����������� 
C �������, ������ ������ '*' �������� ������� ���������� �������� 
C �������.    ���������� �� MAIN. ���������� ������� ���.
C =================================================================
! ����������� �����������: ������� �.�. 2011 �.
! ���� ��������� ����������� �������� ������� �� ������ � ����������� ����,
! �� ��� � � ���������. ����� �������� ����� � ����������� ���� ���������� 
! �������� ����� 8 � ���������������� ���������. ��� ������ ������� � ���������
! ���� ������������ ����� 9. ����������� ����� ������� ������������ �����
! ������ ����������� �������, � ���� ���������� ������ ������� � ���, ���
! ��������� ������ ���������� ������ (������ ������������ ������ �����),
! ���, ��� ����� ������ ������� �������� ������������. ��� �����, ���� ���
! ������� ������������ ������� ��� ��������� �������� �������� ������������
! � ����� ������� ��������� �����������, � �� ����� ������ ����������� � �������.
C ===================== ������ ���� PRNTDD ========================

      subroutine PRNTDD (NSTRT,NSTP,XENV,ENV,DIAG,IPR)

      INTEGER XENV,PROB/' '/,STR,NUL/'0'/,VAL/'*'/,LUN/0/
       DIMENSION ENV(1),DIAG(1),XENV(1),STR(8001),NIL(8001)
C      DIMENSION ENV(1),DIAG(1),XENV(1),STR(8001)
      LOGICAL*1 IPR(50)
       KI=0
  60   FORMAT(1X,'*',I4,8001A1)
  50   FORMAT(15X,'1',9X,'2',9X,'3',9X,'4',9X,'5',9X,'6',9X,'7',9X,'8',
     >9X,'9',9X,'0',9X,'1'/ 6X,11('1234567890'),'12345')
       KNSTRT=NSTRT   !����� ������ ������
       KNSTP=NSTP     !����� ��������� ������(���-�� ������)
       LUN=0
111       KI=KI+1     !�������=1, ������ ENV=2  (������ 1��� �� 2�� "������" ������������)
       NSTRT=KNSTRT
       NSTP=KNSTP
      NSTOP=NSTP*1

         WRITE(6,70)
70     FORMAT(2X,'����� MATP��� ��������� �� 8000 CTO���OB') 
           
      IF(NSTOP-NSTRT.LE.8001) GO TO 500!���� ����� ��������� ������ ������ ������ ������
         NSTOP=NSTRT+8000

 500  WRITE(6,50)!������ ������� ������ (������ ��������)
       If (kI.EQ.1.and.IPR(8)) then
       print*,"������ ������� � ���������� ����:"  
       endif
       If (kI.EQ.2.and.IPR(8)) then  
       print*,"������ ������� ENV � ����������� ����:"
       endif
       
 666   If (kI.EQ.1.and.IPR(9).and.lun.eq.1) then
       print*,"������ ������� � ��������� ����:"  
       endif
       If (kI.EQ.2.and.IPR(9).and.lun.eq.3) then  
       print*,"������ ������� ENV � ��������� ����:"
       endif     
                 LUN=LUN+1
                 ILENTA=0
                 IZV=0
                 INUL=0
                 LOBOL=0
                
                
      K =0          
      DO 10 I=NSTRT,NSTOP!������� ������� �����
      K=K+1              !�-���� ����� ������
      L=0
                  ISZV=0
                  ISNUL=0
                  ILOCLENTA=0
                  NNIL=0 
                   
      DO 20 J=NSTRT,I!������� �������� ������. ����� �������� ����� ������ ������(�.�. ������ �����)
      L=L+1          !�-����� �������

      IF (I.EQ.J) GO TO 21!���� ��������� ������� ������(������������)
      IVAL=XENV(I+1)-I+J!���������� �����
  
      IF(IVAL.LT.XENV(I)) GO TO 22  !���� ����� ������ ���� � �������� �������� ��� ������
      VALUE=ENV(IVAL)       !����� �������� �� ������� ���������
           GO TO 23
 21   VALUE=DIAG(I)         !����� �������� �� ������� ������������ ���������, ���� ������� ��������� � ������
       23   STR(L)=VAL    !������������ ��� �� ���������
            IF(VALUE.NE.0) NNIL=1
                      IZV=IZV+1      !����������� ���-�� ���������
                      ISZV=ISZV+1
          IF(VALUE.EQ.0)then          !���� ������� ������� �������� ����������
          !� �������� ����(���� ������)
                   If (kI.EQ.1)STR(L)=NUL     !��� PROB
                   If (NNIL.EQ.0) STR(L)=PROB !������� ���� �� ������� ����� ��-�� � ������
                   If (kI.EQ.2)   STR(L)=NUL 
                   IZV=IZV-1
                   ISZV=ISZV-1
          endif 
                
                 ILOCLENTA=ISZV+ISNUL      !����� ��������� � ������(������ �����?)
                                           !��������� ����� +ISNUL=0 ������
      GO TO 20
  22   STR(L)=PROB
  20   CONTINUE            
       !��������� ��������� ������ ���� ������
        IF (kI.EQ.1) then       !���������� ����� ������� ���������� ��������
        K15=NSTOP               
        DO 44 JJ=1,L            
        IF(STR(JJ).EQ.VAL)then  
         IF (JJ.LT.K15)then     
         K15=JJ                 
             endif
                 endif
        else K15=I             !����� ����� ������� ���������� ����� �������������
44     IILENTA=I-K15           !������ ����� (����� ���������� ����� ����� �������)
        endif
        IF (kI.EQ.2) then       !���������� ����� ������� ���������� ��������
        K15=NSTOP
        DO 144 JJ=1,L
       IF(STR(JJ).EQ.VAL.OR.STR(JJ).EQ.NUL)then !�������� "0" ��������� ���������
         IF (JJ.LT.K15)then
         K15=JJ
             endif
                 endif
        else K15=I
144     IILENTA=I-K15
         endif

         NIL(I)=IILENTA        !���������� ��������� ������ �����
       LOBOL=LOBOL+IILENTA     !������ �������� ������� ��� ����� ���� ��������� ����� ����
                if(IILENTA.GT.ILENTA)then !�������� ������������ ������ �����
       ILENTA=IILENTA
       III=I                   !���������� ������ � ��� ��� ����������� �������
               endif  
                  
       IF(IPR(9)) then
       if(LUN.eq.2.or.LUN.eq.4) then
        if(k.le.ILENTAMAX) then
           do n=1,k
              str(ILENTAMAX+n)=str(n)
              str(n)=PROB 
           enddo
           WRITE(6,60)I,(STR(J),J=k,k+ILENTAMAX)
        endif
        if(k.gt.ILENTAMAX) WRITE(6,60)I,(STR(J),J=K-ILENTAmax,K) 
        endif
       endif
       
       if(LUN.eq.1.or.LUN.eq.3) then
       if(IPR(8)) WRITE(6,60)I,(STR(J),J=1,K)
       endif
  10   CONTINUE  
         ILENTAMAX=ILENTA !���������� ������ ����� ��� ������������ ������
      if(LUN.eq.1.or.LUN.eq.3) goto 666
         if(kI.EQ.1)WRITE(6,61)IZV-I+1,LOBOL,ILENTA 
         if(kI.EQ.2)WRITE(6,64)IZV-I+1,LOBOL,ILENTA 
         DO 33 I=NSTRT,NSTOP
   33      if(NIL(I).EQ.ILENTA)WRITE(6,62)I 
         if(kI.LT.2) GO TO 111
  61   FORMAT(2X,'�� ��� ����: ��������� ��������� � ��������',I6/
     >2X,'������ �������� �������',I8,/
     >2X,'������������ ������ ����� �������',I8,2X,'� �������:')
  64   FORMAT(2X,'�� ��� ����: ��������� ��������� � ��������',I6/
     >2X,'������ �������� ��������',I8,/
     >2X,'������������ ������ �������� �����',I8,2X,'� �������:')
C       WRITE(6,62) (NIL(I),I=1,NILNOMER)
   62   FORMAT(47X,I6)    
      RETURN
      END

C =================== ����� ���� PRNTDD ===========================
C =================================================================
C ����� ����� PRNTDD.FOR
