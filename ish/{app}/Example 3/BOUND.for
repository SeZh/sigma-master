C ���� BOUND
C �������� ������������ BOUND
C       ����PO�PA��� ������� �P������� �C�OB��
C          B���BAETC� �� MAIN , B���BAEM�X MO���E� HET.    
C ==================================================================
C wwwwwwwwwwwwwwwwww ������ ���� BOUND wwwwwwwwwwwwwwwwwwwwwwwwwwwww
C                                                   ��� Example 3
C ������������ �� ����������� �� ���� � � Y ��� ���� c ����������� X=0.
C ==================================================================
      SUBROUTINE BOUND(NN,CORD,NBC,NFIX,DB,IPR,NP)
      DIMENSION CORD(1),NBC(1),NFIX(1)
    
      LOGICAL*1 IPR(50)
* IPR ������ ���������� �������      
      NB=0
* NB ���������� ����� ������� �����������      
      IF(IPR(21))WRITE(6,18)  
      DO 56 I=1,NP
* NP - ���������� �����
* ���������� ����� ������� �������������� � ������ ������
      X1=CORD(2*(I-1)+1)
      Y1=CORD(2*(I-1)+2)
* ���� ������ ����� ����� �� ����������� ��� ������� ���������, 
* �� �������� �� ��� �����������
      IF (ABS(X1-0).LT.0.01) THEN
          NB=NB+1
* �������� �������� ����� �� ��� �  � �� ��� Y
          NFIX(NB)=11
          NBC(NB)=I
      IF(IPR(21))WRITE(6,19)I,CORD(2*(I-1)+1),CORD(2*(I-1)+2),NFIX(NB)
      ENDIF
  56  CONTINUE
      IF(IPR(21)) PRINT *,"����� ������������ ����� NFIX=",NB
  18  FORMAT('  �PAH��H�E �C�OB��'/' ��E�    X      Y    ���� ')
  19  FORMAT(' ',I4,' ',F7.2,' ',F7.2,'  ',I2)
      NN=NB
      RETURN
      END
C ==================================================================
C wwwwwwwwwwwwwwwwww ����� ���� BOUND  wwwwwwwwwwwwwwwwwwwwwwwwwwwww
C ==================================================================
C ����� ����� BOUND



