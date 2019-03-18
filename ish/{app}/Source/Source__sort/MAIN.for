C ��������� �����������: ������� 2011 ����, ���������� �.�.

C  ���� MAIN.for
C  �������� ��������� MAIN - ����������� ��������� ��������� Sigma
C ===================================================================
C ===================================================================
C �PO�PAMMH�� KOM��EKC SIGMA ��� ������� HA�P��EHHO-�E�OPM�POBAHHO�O
C COCTO�H��  ��OCK�X KOHCTP�K���
C PEA����ET METO� KOHE�HO�O ��EMEHTA  PA�PA�OTAHA HA KA� 603
C           ABTOP PA�PA�OTK� P�CE�K�� B.A.
C �PO�PAMMA MO������POBAHA HA KA� 609
C           ABTOP MO����KA��� CTO��P��K B.A.
C ===================================================================
C ===================================================================
C        MAIN - ��PAB����A� �PO�PAMMA KOM��EKCA
C B���BAET �O��PO�PAMM�:DATA,DGRIDD,GRIDDM,RENMDD,BOUND,
C FORCE, FNENDD,FORMDD,PRNTDD,STRSDD � �.�.(��. ����� ���������� �����)
C
C XADJ - ������,�������� ��������� ��������� �������������� �����
C ADJNCY - ������,�������� ��������� ��������� �������������� �����
C PERM - ������, ���������� �������� ���������������� ��������-�����.
C INVP - ������ � ����������� � ������������ ��� ���������������� �������
C XENV - ��������� ������ ����������� ������
C NOP - ������ ������� �����
C CORD - ������ ���������� ������ ���������� ��������� �����
C DIAG - ������ ������������ ���������
C ORT - ������ ������������� ����������, �� ������� ����������� �����������
C IMAT - ����� ���������
C R - ������ �������� ������ � �����
C NBC - ������ ������� �����, ������� ����������� �� ��� X ��� Y
C NFIX - ������, � ������� ����������� ��� ����������� ����
C ENV - ������ �������� �������
C ESIGMA - ������ �������� 6 ����� ���������� � �������� ���� ��� ������� ��
C IPR - ���������� ������ ���������� ������� (������� � ��������� ����)
C IPR  �������� � "������������ ���������", ������ "���������� �������"
C ===================================================================
C ================== ������ ���� MAIN =============================
       INTEGER*2 I,J
       INTEGER COUNTER
       REAL*8    X1,X2,X3,X4,X5,X6,X7,X8
       DIMENSION XADJ(10000), ADJNCY(60000), PERM(20000), INVP(20000),
     >          XENV(20000), ENV(300000), NOP(30000), CORD(60000),
     >          DIAG(10000),ORT(1000),IMAT(10000),R(30000),NBC(10000),
     >          NFIX(10000), ESIGMA(42000), CORDPO(10),deg(3000),
     >          marker(3000),RCHESET(3000),NBRHD(3000),
     >          QSIZE(3000),QLINK(3000), ADJNCYBC(6000),
     >          FORM(40),GLOB(9),Density(10000),
     >          XP(600),YP(600),ZP(600),
     >          CORDD(1),NDD(8,20),JT(20,4),BBB(3,6)
C ******************************************************************
C NFP=10 �O���ECK�� HOMEP �A��A ��PAB�EH�� �E�AT�� PRINTF01 FORTRAN
C ******************************************************************
       dimension mrglnk(1000),nzsub(3000),
     > rchlnk(1000), xlnz(3000),xnzsub(3000)
       integer flag,maxlnz,maxsub,FL

       INTEGER NFP/10/,XADJ,ADJNCY,PERM,INVP,XENV,ENVSZE,BANDW,test
        LOGICAL PREP
       LOGICAL*1 IPR(50)
C       character*512  ExpGrd

       DATA R/30000*0.0/,IMAT/10000*1/,IPR/50*.FALSE./,
     > TEXTF/'FORM'/,ORT/1000*0.0/,Density/10000*1.0/,
     > PRM1/0.0/,PRM2/0.0/,PRM3/0.0/,PRM4/0.0/,PRM5/0.0/,PRM6/0.0/
C
C        �ABO��M �AC�
C     CALL STIMER ('TASK',EXIT,1000000)
C ***************************************************************
C        C��T�BAH�E �AHH�X �O KOHCTP�K���
C ================================================================

       OPEN(33,FILE='RESULT1.BIN',FORM='BINARY')
       OPEN(34,FILE='RESULT2.BIN',FORM='BINARY')

       WRITE(6,777)
777    FORMAT(9X,'Hello!')


!    �������� �.�.
!    �������� ����� ����� � ������� �� �������������
!    ���� ��� ����������� ����� ����������, ������ �������� � ������ ��
!    �������������
      PREP = .FALSE.
      inquire( file="bounds.nodes", exist=PREP)
      IF (PREP) THEN
      inquire( file="forces.nodes", exist=PREP)
      ENDIF
      IF (PREP) THEN
      inquire( file="materials.elems", exist=PREP)
      ENDIF
      IF (PREP) THEN
      inquire( file="prep_griddm.elems", exist=PREP)
      ENDIF
      IF (PREP) THEN
      inquire( file="prep_griddm.nodes", exist=PREP)
      ENDIF
! ������������� PREP � ���������� ���������� ��� ������ ��������� �
! �������������� �������


       IF(IPR(26)) WRITE(6,999)
999    FORMAT(/,5X,'**********Start  DATA',/,
     > 10X,'(���������� �������� ���������� ������)',/)
C ================================================================
       CALL DATA  (NFP,IPR,ORT,NMAT,NCN,NDF,NRC,DD,DB,DH,
     > PRM1,PRM2,PRM3,PRM4,PRM5,PRM6,FL)
C ==============================================================
       IF(IPR(26)) WRITE(6,1000)
1000   FORMAT(/,5X,'*****Finish DATA')
C ==============================================================
C      �OPM�P�EM �AHH�E ��� GRIDDM
C *******************************************************
       IF(IPR(26)) WRITE(6,998)
998    FORMAT(/,5X,'*****Start DGRIDD',/,
     > 10X,'(���������� ������ ���������)')
C ================================================================
       CALL DGRIDD (INRG,INBP,XP,YP,ZP,JT,NDD,NCN)
C
       IF(IPR(26))  WRITE(6,79)
79     FORMAT(5X,'*****Finish DGRIDD')
C ===============================================================
C  �PO�PAMMA �O��OTOBK� �CXO�H�X �AHH�X ��� MK�
C  �OPM�POBAH�E CETK� KOHE�H�X ��EMEHTOB
C  ==============================================================


       IF(IPR(26)) WRITE(6,997)
997    FORMAT(/,5X,'*****Start  GRIDDM',/,
     > 10X,'(��������� ����� �������� ���������)'/)
C ================================================================
      IF (PREP) THEN
       CALL PREP_GRIDDM(NRC,NOP,IPR,NP,NE,CORD,
     >  INBP,INRG,NDD,XP,YP,ZP,JT,NCN,ENV,NMAT,IMAT)
      ELSE
       CALL GRIDDM(NRC,NOP,IPR,NP,NE,CORD,
     >  INBP,INRG,NDD,XP,YP,ZP,JT,NCN,ENV,NMAT,IMAT)
      ENDIF
C
       IF(IPR(26)) WRITE(6,1001)
1001   FORMAT(/,5X,'*****Finish GRIDDM')
C ================================================================
c ���������� � ���� 2 ������ �����, ������������ �������� ��������.

       DO 663 I=1,NE
        WRITE(34) INT2(NOP(NCN*(I-1)+1))
        WRITE(34) INT2(NOP(NCN*(I-1)+2))
        WRITE(34) INT2(NOP(NCN*(I-1)+3))
663    CONTINUE
       WRITE(34) INT2(-1)

c ���������� � ���� 1 ���������� ����� ����� ��������� �� ��.

       DO 664 I=1,NP
        X1 = CORD(2*(I-1)+1)
        X2 = CORD(2*(I-1)+2)

c ���������� ����������� "-1" �� ��������� ������
       IF(X1.eq.(-1)) X1=X1+0.001
       IF(X2.eq.(-1)) X2=X2+0.001
c
        WRITE(33) X1,X2
664    CONTINUE
       WRITE(33) DBLE(-1)

C  ==============================================================
C  �EPEH�MEPOB�BAEM ��� O�EC�E�EH�� MIN ��P�H� �PO����
C  ==============================================================

554    IF(IPR(26)) WRITE(6,996)
996    FORMAT(/,5X,'*****Start RENMDD',/,
     > 10X,'(������������� �����)'/)
C      write (6,500) NP,NE,NCN
C500   FORMAT (/,'NP=',I5,'  NE=',I5,'  NCN=',I5)
C ================================================================
       CALL RENMDD(NP,NE,NCN,NOP,PERM,INVP,XADJ,ADJNCY,IPR,
     > CORD,ESIGMA,FL,deg,marker,RCHESET,NBRHD,QSIZE,
     > QLINK,ADJNCYBC)
        neqns=np
       IF(IPR(26))WRITE(6,1002)
1002   FORMAT(/,5X,'*****Finish RENMDD')
       IF(IPR(14))WRITE(6,99)(I,(NOP(NCN*(I-1)+J),J=1,NCN),I=1,NE)
99     FORMAT(/' ����� ��������� ����� (������� � ��� ����)',
     > 2X,' MACC�B <<NOP>>'/(3('  *N',I3,'(' ,3I4,')')))


c       calc(XADJ,ADJNCY,PERM,INVP,XENV,ENV,NOP,cord,
c     >diag,ort,imat,nrc,inrg,r,NBC,NFIX,ESIGMA,NLL)
C   ==============================================================
C              �A�AH�E  �PAH��H�X �C�OB��
C   ==============================================================
       IF(IPR(26)) WRITE(6,995)
995    FORMAT(/,5X,'*****Start BOUND',/,
     > 10X,'(���������� ��������� �������)'/)
C ================================================================
      IF (PREP) THEN
       CALL PREP_BOUND(NB,CORD,NBC,NFIX,DB,IPR,NP,INVP) ! ��������� �.�. 2010 :-)
      ELSE
       CALL BOUND(NB,CORD,NBC,NFIX,DB,IPR,NP)
      ENDIF

       IF(IPR(26)) WRITE(6,1003)
1003   FORMAT(/,5X,'*****Finish BOUND')

c ���������� � ���� 1 ��������� �������.

       DO 665 I=1,NB
        IF (NFIX(I).EQ.0) GOTO 665
        J = NBC(I)
        X1 = CORD(2*(J-1)+1)
        X2 = CORD(2*(J-1)+2)
        J = NFIX(I)
C ���������� ����������� "-1" �� ��������� ������
       IF(X1.eq.-1) X1=X1+0.001
       IF(X2.eq.-1) X2=X2+0.001
       IF(X3.eq.-1) X3=X3+0.001

        WRITE(33) X1,X2,INT1(J)
665    CONTINUE
       WRITE(33) DBLE(-1)

C   ==============================================================
C               PA�HECEH�E HA�P��K�
C   ==============================================================
       IF(IPR(26)) WRITE(6,994)
994    FORMAT(/,5X,'*****Start FORCE',/,
     > 10X,'(���������� ������� �����������)'/)
C ================================================================
      IF (PREP) THEN
       CALL PREP_FORCE(NB,CORD,NRC,DB,IPR,NP,RSUM,R,NDF,DH,NR,
     > PRM1,PRM2,PRM3,PRM4,PRM5,PRM6, INVP) ! ��������� �.�. 2010 :-)
      ELSE
       CALL FORCE(NB,CORD,NRC,DB,IPR,NP,RSUM,R,NDF,DH,NR,
     > PRM1,PRM2,PRM3,PRM4,PRM5,PRM6)
      ENDIF



             IF(IPR(26)) WRITE(6,1004)
1004   FORMAT(/,5X,'*****Finish FORCE')
C   ����������� ������ ���������� ������ ����� FORCE
       IF(IPR(17)) then
       WRITE(6,3)NP,NE,NB,NR,NCN,NDF,NMAT
 3     FORMAT(/,13X,'����������� ������ ���������� ������',
     > /3X,'�����',I5,3X,'���������',I5,
     > /3X,'������������ �����',I3,3X,'����������� �����',I3
     > /3X,'����� � ��������',I2,3X,'�������� �������',I2,
     > /3X, '������� �������� ���������',I2)
       IK=-6
       DO 166 KK=1, NMAT
      IK=IK+7
166    WRITE(6,144) KK, ORT(IK),ORT(IK+1),ORT(IK+2),ORT(IK+6)
144    FORMAT(2X,'CBO�CTB�:',I3,2X,'MO���� E =',F9.0,2X,
     > 'M� =',F4.2/16X,'����������� ���������� SB =',
     > F6.0,2X,'������� =',F4.2)
       endif
C   ==============================================================
C ���������� � ���� 1 ���������� �����, � �������
C     ��������� ����, � �������� ���� ���.
C   ==============================================================
       DO 666 I=1,NP
        X1 = R((I-1)*NDF+1)
        X2 = R((I-1)*NDF+2)
        IF ((X1.EQ.0).AND.(X2.EQ.0)) GOTO 666
        X3 = CORD(2*(I-1)+1)
        X4 = CORD(2*(I-1)+2)
C       ���������� ����������� "-1" �� ��������� ������
       IF(X3.eq.-1) X3=X3+0.001
       IF(X4.eq.-1) X4=X4+0.001
       IF(X1.eq.-1) X1=X1+0.001
       IF(X2.eq.-1) X2=X2+0.001
C
        WRITE(33) X3,X4,X1,X2
666    CONTINUE
       WRITE(33) DBLE(-1)

       IF(IPR(19)) WRITE(6,9)(N,(CORD(2*(N-1)+M),M=1,2),N=1,NP)
c ���������� � ���� 1 ���������� ����� � ������ ����� ���������.
       DO 667 I=1,NP
        X1 = CORD(2*(I-1)+1)
        X2 = CORD(2*(I-1)+2)
c ���������� ����������� "-1" �� ��������� ������
       IF(X1.eq.-1) X1=X1+0.001
       IF(X2.eq.-1) X2=X2+0.001
c

        WRITE(33) X1,X2
667    CONTINUE
       WRITE(33) DBLE(-1)

9      FORMAT('  KOOP��HAT� ���OB'/3(3X,I4,2F7.2))
       GO TO 808
55     WRITE(6,155)
155    FORMAT(5X,'O���KA �P� C��T�BAH��')
808    NSZF=NP*NDF

C   ==============================================================
C   PEA����ET �PO����H��  CXEM� XPAHEH�� PA�PE�EHHO� MATP���
C   ==============================================================
       IF(IPR(26)) WRITE(6,993)
993    FORMAT(/,5X,'*****Start FNENDD',/,10X,
     > '(���������� ���������������� ���������� ����� ��������)'/)
C ================================================================
       CALL FNENDD (NP,NDF,XADJ,ADJNCY,PERM,INVP,
     >  XENV,ENVSZE,BANDW)
       IF(IPR(26))  WRITE(6,992)
992    FORMAT(/,5X,'*****Finish FNENDD')

       IF(IPR(27)) WRITE(6,16) NSZF+1, XENV(1),
     >  (XENV(I+1),I=1,NSZF)
  16   FORMAT (5X,'������������� ������ (XENV)',
     > 3X,'������ XENV=',I5 /(10I6))

       IF(IPR(28)) WRITE(6,17) ENVSZE,BANDW+1
  17   FORMAT ( '   PA�MEP O�O�O�K� -',I8,'
     >   ��P�HA �EHT� -',I5)
C   ==============================================================
C    � ���������� ����� �������� ������� ������ �����:
C     ������ �������� = ENVSZE + ��������� =
C     2NP + ������ ������� �������� XENV = nszf+1
        IF(IPR(25)) then
         print*,'begin memory'
       if(((fl.lt.4).and.(fl.ge.0)).or.(fl.eq.-2).or.(fl.eq.21).
     >  or.(fl.eq.-4).or.(fl.eq.11).or.(fl.eq.12).or.(fl.eq.22))then
       print*,''
       print*,'���������������� ���������� ����� �������� '
       print*,''
       print*,'���������:',2*np
       print*,'������ ��������:',ENVSZE
       print*,'������ ��������� �������:',nszf+1
       print*,'������� ������ ���������� ����� ��������:',
     > (nszf+1+ENVSZE+2*np)
       endif
        endif
C   ==============================================================
       print*,''
       print*,'end memory'

C ================================================================
       IF(IPR(20))WRITE (6,101) NP,NE,NB
       IF(IPR(20))WRITE(6,103)(I,(NOP(NCN*(I-1)+J),
     >  J=1,NCN),I=1,NE)
103    FORMAT(/'  NOP ����� FORMDD'/3('  *N',I3,'(',3I4,')'))
101    FORMAT(/,3X,'NP=',I5,3X,'NE=',I5,3X,'NB=',I5)
C ================================================================
C �OPM�P�ET MATP��� �ECTKOCT� ��� �PO����HO�O METO�A PE�EH��
C ================================================================
       IF(IPR(26)) WRITE(6,991)
991    FORMAT(/,5X,'*****Start FORMDD',/,
     > 10X,'(������������ ������� ���������)'/)
       CALL FORMDD (NP,NE,NCN,NDF,NB,NMAT,BANDW,NOP,
     >       CORD,ORT,IMAT,NBC,NFIX,XENV,DIAG,ENV,BBB,IPR,PREP)
       IF (IPR(26)) WRITE(6,1006)
1006   FORMAT(/,5X,'*****Finish FORMDD')

C   ==============================================================
C   �E�AT� MATP��� B B��E:EC�� * ,TO ��EMEHT MATP��� HEH��EBO�
C   ==============================================================
       IF(IPR(8).or.IPR(9)) GO TO 687
       GO TO 686
687    IF (IPR(26))WRITE(6,688)
688    FORMAT(/,5X,'*****Start PRNTDD',/,
     > 10X,'(���������� �������)'/)
C ================================================================
         WRITE(6,800)
800    FORMAT(/,2(30X,'���������� ������� �')/)
       CALL PRNTDD(1,NSZF,XENV,ENV,DIAG,IPR)
       IF (IPR(26)) WRITE(6,689)
689    FORMAT(/,5X,'*****Finish PRNTDD')

*----------------��������� ������������ �.�. 2011�.
*----- ��� ������ ����������� ������������� �������

686    OPEN(36,FILE='RESULT3.BIN',FORM='BINARY')
       WRITE(36) INT4(NSZF)
       WRITE(36) INT4(-1)
       DO I =1, NSZF+1
          WRITE(36) INT4(XENV(I))
       ENDDO
       WRITE(36) INT4(-1)
       WRITE(36) INT4(ENVSZE)
       WRITE(36) INT4(-1)
*���������� ������ ������� ������ � ������. ���� ������ ��� �� �������.
       DO COUNTER=1, ENVSZE
        IF(ENV(COUNTER).EQ.0.0) THEN
            WRITE(36) INT4(0)
        ENDIF
        IF(ENV(COUNTER).NE.0.0) THEN
            WRITE(36) INT4(1)
        ENDIF
       ENDDO
       WRITE(36) INT4(-1)
*---------����� ��������� �� �����������

C
C   ==============================================================
C      PE�EH�E C�CTEM� �PABHEH�� �PO����H�M METO�OM
C   ==============================================================
C
       IF(IPR(26)) WRITE(6,990)
990    FORMAT(/,5X,'*****Start RCMSLV',/,
     > 10X,'(������� ������� �������� ���������)'/)
C ================================================================
       CALL RCMSLV (NSZF,XENV,ENV,DIAG,R,IERR,IPR)
       IF (IPR(26)) WRITE(6,1007)
1007   FORMAT(/,5X,'*****Finish RCMSLV')
C
*----------------��������� ������������ �.�. 2011�.
*----- ��� ������ ����������� ������������� ���������
*----- ��������! �������� � ������, ���� � ������������ RCMSLV �� ��������,
*----- ����� ����� ��������� ������������ ������
       DO I =1, NSZF+1
          WRITE(36) INT4(XENV(I))
       ENDDO
       WRITE(36) INT4(-1)
       WRITE(36) INT4(ENVSZE)
       WRITE(36) INT4(-1)
*���������� ������ ������� ������ � ������. ���� ������ ��� �� �������.
       DO COUNTER=1, ENVSZE
        IF(ENV(COUNTER).EQ.0.0) THEN
            WRITE(36) INT4(0)
        ENDIF
        IF(ENV(COUNTER).NE.0.0) THEN
            WRITE(36) INT4(1)
        ENDIF
       ENDDO
       WRITE(36) INT4(-1)
*--------����� ��������� �� �����������

       IF(IERR.NE.0) WRITE(6,10) IERR
10     FORMAT (//'PE�EH�E HE MO�ET ��T� �O���EHO, T. K.',
     >   ' MATP��A HE �O�O��TE��HO O�PE�E�EHA !!!  N = ',I5)
       IF(IPR(31)) WRITE(6,11) (I,(R((I-1)*NDF+J),
     >  J=1,NDF),I=1,NP)

C ���������� � ���� 1 ����������� �����.

       DO 668 I=1,NP
        X1 = R((I-1)*NDF+1)
        X2 = R((I-1)*NDF+2)

c ���������� ����������� "-1" �� ��������� ������
       IF(X1.eq.-1) X1=X1+0.001
       IF(X2.eq.-1) X2=X2+0.001
c

        WRITE(33) X1,X2
668    CONTINUE
       WRITE(33) DBLE(-1)

  11   FORMAT (//' �EPEME�EH�� ���OB'/2(I5,2G12.4))
  12   FORMAT (//' C��T�BAH�E �CXO�H�X
     > �AHH�X  �AKOH�EHO  �C�E�HO')

C   ==============================================================
C            O�PE�E�EH�E HA�P��EH�� � �EPEME�EH�� B ���AX
C   ==============================================================

       IF(IPR(26)) WRITE(6,889)
889    FORMAT(/,5X,'*****Start STRSDD',/,
     > 10X,'(������ ����������)'/)
C ================================================================
       CALL STRSDD ( 3,NP,NE,NCN,NDF,DD,NOP,R,ESIGMA,IPR,BBB)
       IF(IPR(26)) WRITE(6,1008)
1008   FORMAT(/,5X,'*****Finish STRSDD')

c ���������� � ���� 2 �������� ���������� � ��.

       DO 669 I=1,NE
        X1 = ESIGMA(7*(I-1)+1)
        X2 = ESIGMA(7*(I-1)+2)
        X3 = ESIGMA(7*(I-1)+3)
        X4 = ESIGMA(7*(I-1)+4)
        X5 = ESIGMA(7*(I-1)+5)
        X6 = ESIGMA(7*(I-1)+6)
        X7 = ESIGMA(7*(I-1)+7)
c ���������� ����������� "-1" �� ��������� ������
       IF(X1.eq.-1) X1=X1+0.001
       IF(X2.eq.-1) X2=X2+0.001
       IF(X3.eq.-1) X3=X3+0.001
       IF(X4.eq.-1) X4=X4+0.001
       IF(X5.eq.-1) X5=X5+0.001
       IF(X6.eq.-1) X6=X6+0.001
       IF(X7.eq.-1) X7=X7+0.001

        WRITE(34) X1,X2,X3,X4,X5,X6,X7
669    CONTINUE
       WRITE(34) DBLE(-1)
c ���������� �������� ����������
       DO 701 I=1,21
        X1 = ORT(I)

c ���������� ����������� "-1" �� ��������� ������
       IF(X1.eq.-1) X1=X1+0.001
c

        WRITE(34) X1
701    CONTINUE
       WRITE(34) DBLE(-1)

       DO 700 I=1,NE
        J = IMAT(I)
c ���������� ����������� "-1" �� ��������� ������
       IF(J.eq.-1) J=J+1
c
        WRITE(34) J
700    CONTINUE
       WRITE(34) INT2(-1)
        WRITE(6,188)
188     FORMAT(/,7X,'****good luck****')

* ���������� �� ��������� �.�. � ���� RESULT2 ������������ ���������� �� �������� ��������� �� ����.
* ��� ���������� ������������ � ����������� ����������� �����������.
* ���������� � ���� 2 ���������� ���
       WRITE (34) INT2(INRG)
       WRITE (34) INT2(-1)
* � ������ ���������� ��� ������ ���� ���������� 8�� �����
       DO I=1, INRG
         DO J=1,8
          X1=XP(NDD(J,I))
          X2=YP(NDD(J,I))
          IF(X1.eq.-1) X1=X1+0.001
          IF(X2.eq.-1) X2=X2+0.001
          WRITE(34)X1
          WRITE(34)X2
         ENDDO
       ENDDO
       WRITE (34) DBLE(-1)

C ================================================================
C ���������� ������ ������ ��� ���������� ���������� Sigma Postproc
C � ����������� ����������� � 3D - �������.
C  ������������ Grid, Sigmas, Delta, Materials, PDensity
C ��������� � ����� C_dgridd_DGRIDD.for
C ================================================================
       call Grid(CORD,NP,NOP,NE,'ExpGrd.poi')
       call Sigmas (ESIGMA,NE,'ExpGrd.poi')
       call Delta(R,NP,NDF,'ExpGrd.poi')
       call Materials(IMAT,NE,ORT,'ExpGrd.poi')
       call PDensity(Density,NE,'ExpGrd.poi')
C*********************************************
C*********************************************
C********                     ****************
C********  ������� � Nastran  ****************
C********                     ****************
C*********************************************
C*********************************************
       OPEN(35,FILE="Nastran.ns1")
       DO I=1,NE
       WRITE(35,442) I,IMAT(I),NOP(NCN*(I-1)+1),
     > NOP(NCN*(I-1)+2),NOP(NCN*(I-1)+3)
       ENDDO
442    FORMAT(' ',I4,'    ',I4,'    ',I4,
     > '    ',I4,'    ',I4)
       CLOSE(35)
C*********************************************

       CLOSE(33)
       CLOSE(36)
       CLOSE(34)
       STOP
       END
C ================ ����� ���� MAIN ===========================
C ============================================================
C ����� ����� MAIN.for
