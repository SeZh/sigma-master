C ���� BOUND
C �������� ������������ BOUND
C       ����PO�PA��� HA�O�E��� �P������� �C�OB��
C          B���BAETC� �� MAIN , B���BAEM�X MO���E� HET.       
C ==================================================================
C wwwwwwwwwwwwwwwwww ������ ���� BOUND wwwwwwwwwwwwwwwwwwwwwwwwwwwww
C                                                ��� Example 2
C ������������ �� ����������� ����� ��� Y  ��� ���� c ����������� Y=0.
C ������������ �� ����������� ����� ��� X  ��� ���� c ����������� �=0.
C ==================================================================
      SUBROUTINE BOUND(NN,CORD,NBC,NFIX,DB,IPR,NP)
C
C       �PO�P��A HA�O�E��� �P�H �C�OB��,B���BAETC� �� MAIN1
C
      DIMENSION CORD(1),NBC(1),NFIX(1)

      LOGICAL*1 IPR(50)
* IPR ������ ���������� �������      
      NB=0
* NB ���������� ����� ������� �����������      
      WRITE(6,18)  
      DO 56 I=1,NP
* NP - ���������� �����
* ���������� ����� ������� �������������� � ������ ������
      X1=CORD(2*(I-1)+1)
      Y1=CORD(2*(I-1)+2)
      IF (ABS(X1-0).LT.0.01) THEN
        NB=NB+1
          NFIX(NB)=10
          NBC(NB)=I
          WRITE(6,19) I,CORD(2*(I-1)+1),CORD(2*(I-1)+2),NFIX(NB)
      ENDIF
      IF (ABS(Y1-0).LT.0.01) THEN
          NB=NB+1
          NFIX(NB)=1
          NBC(NB)=I
          WRITE(6,19) I,CORD(2*(I-1)+1),CORD(2*(I-1)+2),NFIX(NB)    
      ENDIF       
  56  CONTINUE
  18  FORMAT('  �PAH��H�E �C�OB��'/' ��E�    X      Y    ���� ')
  19  FORMAT(' ',I4,' ',F7.2,' ',F7.2,'  ',I2)
      NN=NB
      RETURN
      END
C ==================================================================
C wwwwwwwwwwwwwwwwww ����� ���� BOUND  wwwwwwwwwwwwwwwwwwwwwwwwwwwww
C ==================================================================


