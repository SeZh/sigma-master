C ���� FINDNODD.FOR
C �������� ������������ FINDNODD, PROPERTYGRIDDM � PROPERTYFORMDD 
C =============================================================
c ��������� ������ �����, ������� �� ������� ������� �� 
C ���������� �� REGULARIZATION ���������� ������� ���
C =============================================================
C NTMOVE ������, �������� ������� ����������� ����������� ����� 
C ��������  ��� �����������.
C I-�� ������� ������� ������ ������� ��� I-��� ���� ��������
C (0 -����������� ���������,1 - ����������� ���������)
C ����� ��������� ������� ������� ����� NPM - ����� ����� ��������
C CORDDRM - ������ ��������� �����
C ================================================================
C wwwwwwwwwwwwwwwwww ������ ���� FINDNODD wwwwwwwwwwwwwwwwwwwwwwww
C ================================================================

      SUBROUTINE FINDNODD(NTMOVE,NPM,CORDDRM)

       DIMENSION NTMOVE(1),CORDDRM(1)
       INTEGER NPM,I,MAX1,NTMOVE
       REAL X1,Y1,CORDDRM
C     ������� ����� ��������
       DO 561 I=1,NPM
C  NPM - ���������� �����
C  ���������� ����, ������� �������������� � ������ ������
       X1=CORDDRM(2*(I-1)+1)
       Y1=CORDDRM(2*(I-1)+2)
C ��������� ������ ��������� ����������� ��� Example 3 : ���� ������
C ���� ����� �� �������������� ������ Y=40, ��� �� ������ X=40 ����
C ������ Y=40, �� ��������� �������� ����� ���� ��� ����������� �����.
       IF (ABS(Y1-40.0).LT.0.001) NTMOVE(I)=1
       IF (Y1.GE.40.AND.ABS(X1-40.0).LT.0.001) NTMOVE(I)=1
  561  CONTINUE
      return
      end
C =================================================================
C wwwwwwwwwwwwwwwwww ����� ���� FINDNODDwwwwwwwwwwwwwwwwwwwwwwwwww
C =================================================================   
C ============================================================
C ������������ PROPERTYGRIDDM ���������� ������� �� � ��������� �����
C       ����������  ������� �� � Griddm  (������ 1)
c      ��� Example 3: �� ��� 7 � 8 ������������� �������� 3
C =================================================================
C wwwwwwwwwwwwwwwwww ������ ����  PROPERTYGRIDDM  wwwwwwwwwwwwwwwwww
C =================================================================
       subroutine  PROPERTYGRIDDM (NRG,NMAT,NEL,IMAT)
        DIMENSION IMAT(1)
       IF ((NRG.EQ.7).AND.(NMAT.GE.3)) IMAT(NEL) = 3
       IF ((NRG.EQ.8).AND.(NMAT.GE.3)) IMAT(NEL) = 3 
        RETURN
        END
C =================================================================
C wwwwwwwwwwwwwwwwww ����� ����  PROPERTYGRIDDM  wwwwwwwwwwwwwwwwww
C =================================================================  
C
C ������������  PROPERTYFORMDD ���������� ������� �� � Formdd 
C (������ 2 ���������� �������)
C ================================================================
C       ��� Example 3 �� ���� Y=40 ����������� �������� 2
C =================================================================
C wwwwwwwwwwwwwwwwww ������ ����  PROPERTYFORMDD  wwwwwwwwwwwwwwwwww
        subroutine PROPERTYFORMDD (NE,NCN,NMAT,CORD,IMAT,NOP)
        DIMENSION CORD(1),IMAT(1),NOP(1)
        DO 300 I=1,NE
         J=(I-1)*NCN
         DO 400 JJ=1,3
       IF (NMAT.ge.2.and.(40.0-CORD((NOP(J+JJ)-1)*2+2)).gt.0.01) THEN
           IMAT(I)=2
           ENDIF
 400    CONTINUE
 300    CONTINUE
       RETURN
       END
C wwwwwwwwwwwwwwwwww ����� ����  PROPERTYFORMDD wwwwwwwwwwwwwwwwwwww