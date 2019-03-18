C �������� �.�., 06-421
C ==================================================================
C ���� BOUND.for
C �������� ������������ BOUND
C       ����PO�PA��� HA�O�E��� �P������� �C�OB��
C          B���BAETC� �� MAIN , B���BAEM�X MO���E� HET.       
C ==================================================================
C ================== ������ ���� BOUND =============================
C                                                ��� Example 1
C ==================================================================
      SUBROUTINE BOUND(NN,CORD,NBC,NFIX,DB,IPR,NP)
C
C       �PO�P. HA�O�. �P��. �C�OB��,B���BAETC� �� MAIN1
C
      DIMENSION CORD(1),NBC(1),NFIX(1)
      LOGICAL*1 IPR(50)
      REAL XI,YI
      NB=0
      WRITE(6,18)  
      DO I=1,NP !���� ������ �����
      XI = CORD(2*(I-1)+1)
      YI = CORD(2*(I-1)+2)
      !���� ����� ����������� ����������:
      IF (ABS(10.0-SQRT(XI**2+YI**2)).LT.0.01) THEN
      NB=NB+1
      NBC(NB)=I
      NFIX(NB)=11  !����������� �� X � Y
      WRITE(6,19) I,CORD(2*(I-1)+1),CORD(2*(I-1)+2),NFIX(NB)
      !���� ����� ����� �� ��� Y
      ELSE IF (XI.LT.0.01) THEN
      NB = NB+1
      NBC(NB)=I
      NFIX(NB)=10  !����������� �� X
      WRITE(6,19) I,CORD(2*(I-1)+1),CORD(2*(I-1)+2),NFIX(NB)
      !���� ����� ����� �� ��� X
      ELSE IF (YI.LT.0.01) THEN
      NB = NB+1
      NBC(NB)=I
      NFIX(NB)=1 !����������� �� Y
      WRITE(6,19) I,CORD(2*(I-1)+1),CORD(2*(I-1)+2),NFIX(NB)
      ENDIF
      ENDDO
      
      IF(IPR(21)) PRINT *,"����� ������������ ����� NFIX=",NB  
  18  FORMAT('  �PAH��H�E �C�OB��'/' ��E�    X      Y    ���� ')
  19  FORMAT(' ',I4,' ',F7.2,' ',F7.2,'  ',I2)
      NN=NB
      RETURN
      END
C ==================================================================
C ================== ����� ���� BOUND  =============================
C ==================================================================
C ����� ����� BOUND.for