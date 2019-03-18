C=============================================================================
C  ���� SMBFCT.for
C  ���������� �� ������ RENMDD  
C             ��������� �.�. - 2012 -      
C-----------------------------------------------------------------------------
C       ������������� ����������
C-----------------------------------------------------------------------------        
C  ������� ������:
C          NP - ���������� �����
C          XADJ, ADJNCY - ��������� ��������� �����
C  �������� ������:
C           Perm - ������ ������������  
C-----------------------------------------------------------------------------
C  �������� ������ ���������:
C  ������������ ������������ ������������� ���������� ����������������� �������� 
C  ������� � ��������� ���������� ��������� ������ ��� ��.
C-----------------------------------------------------------------------------
C      ���������� ��������-
C        MAXSUB - ������ ������� NZSUB. �� ������ ����� �����
C      �������������� ��������.C
C      �������� ��������� -
C          XLNZ - ������� ��� ������� ��������� ��������� LNZ.
C       (XNZSUB, NZSUB) - ��������� ������� ���������� ����� .
C       MAXLNZ - ����� ��������� ��������� ���������.
C       FLAG - ��������� ������ . ������������� ��������
C       ���������, ��� ������ NZSUB ������������.     C
C      ������� ��������� -
C       MRGLNK - ������ ����� NEQNS . �� � - �� ���� ������
C       MRGLNK (�), MRGLNKI(MRGLNK(K)) ,...........
C       �������� ������ ���� �������� L(*,J), ���
C       ������� J< � � ������ ���������
C        ��������������� ������� - L(K,J). �.�.,
C        ��������� ��������� ��������� ������� L(*, �)
C        ����� ���������� �������� �������� �����
C        �������� L(*, J) �� ���������� �(*, �).
C        RCHLNK - ������ ����� NEQNS. ������������ ���
C        ������������ ��������� ���������� �������
C        L(*, �). � ����� �-�� ���� ������ RCHLNK(K),
C        RCHLNK(RCHLNK(K)) ,.........
C        �������� ������� ��������� ���������
C        �-��� ������� ��������� L.
C        MARKER - ����� ������ ����� NEQNS ��� ��������
C        ����������� ���������� ��������������
C        ���������� . �.�. , � ��� ������� �����������,
C        ����� �� ��������� ��������������� � ������
C        ������ �-��� ������� ��������� ����������
C        ������������ �������� � ������� MRGLNK(K).      
C-----------------------------------------------------------------------------
         SUBROUTINE SMBFCT (NEQNS, XADJ, ADJNCY, PERM, INVP, 
     >    XLNZ, MAXLNZ, XNZSUB, NZSUB, MAXSUB,
     >    RCHLNK, MRGLNK, MARKER, FLAG )
C-----------------------------------------------------------------------------
        INTEGER ADJNCY(1), INVP(1), MRGLNK(1), NZSUB(1), 
     >    PERM(1), RCHLNK(1), MARKER(1)
        INTEGER XADJ(1), XLNZ(1), XNZSUB(1), 
     >    FLAG, I, INZ, J, JSTOP, JSTRT, K, KNZ,
     >     KXSUB, MRGK, LMAX, M, MAXLNZ, MAXSUB,
     >    NABOR, NEQNS, NODE, NP1, NZBEG, NZEND,
     >    RCHM, MRKFLG
C-----------------------------------------------------------------------------
C       �������������...
        NZBEG = 1 
        NZEND = 0 
        XLNZ(1) = 1 
        DO 100 K = 1, NEQNS 
           MRGLNK(K) = 0 
           MARKER(K) = 0 
100     CONTINUE
C-------------------------------------------------------------------                 
C       ��� ������� �������... . KNZ ������������ ����� ���������
C        ��������� �-��� �������, �������������� � RCHLNK.
C-------------------------------------------------------------------        
        NP1= NEQNS + 1 
        DO 1500 K =1, NEQNS
           KNZ = 0
           MRGK = MRGLNK(K) 
           MRKFLG = 0 
           MARKER(K) = K
           IF (MRGK. NE. 0 ) MARKER(K) = MARKER(MRGK)
           XNZSUB(K) = NZEND
           NODE = PERM(K)
           JSTRT = XADJ(NODE)
           JSTOP = XADJ(NODE+1) - 1
           IF (JSTRT.GT.JSTOP) GOTO 1500
C----------------------------------------------------------------        
C       ��������� RCHLNK, ��������� ������ ���������
C        ��������������� ��������� ������� �(* ,�) .
C----------------------------------------------------------------        
           RCHLNK(K) = NP1 
           DO 300 J = JSTRT, JSTOP
           NABOR = ADJNCY(J) 
           NABOR = INVP(NABOR) 
           IF ( NABOR .LE. K ) GOTO 300 
              RCHM = K 
200              M = RCHM
              RCHM = RCHLNK(M)
              IF ( RCHM .LE. NABOR ) GOTO 200 
                 KNZ = KNZ+1 
                 RCHLNK(M) = NABOR 
                 RCHLNK(NABOR) = RCHM
                 IF ( MARKER(NABOR) .NE. MARKER(K) ) MRKFLG = 1
300        CONTINUE 
C-------------------------------------------------------------        
C          �������� �� ��������� ������������� ���������� . . .
C-------------------------------------------------------------        
           LMAX = 0
           IF ( MRKFLG.NE.0.OR.MRGK.EQ.0 ) GOTO 350
           IF ( MRGLNK(MRGK) .NE. 0 ) GOTO 350
           XNZSUB(K) = XNZSUB(MRGK) + 1
           KNZ = XLNZ(MRGK+1) - (XLNZ(MRGK) + 1)
           GOTO 1400
C-------------------------------------------------------------        
C       ��� ������� ������� X, ��������������� �� L(*,K),
C-------------------------------------------------------------        
350           I = K
400           I = MRGLNK(I)
           IF (I.EQ.0) GOTO 800
              INZ = XLNZ(I+1) - (XLNZ(I)+1) 
              JSTRT = XNZSUB(I) + 1 
              JSTOP = XNZSUB(I) + INZ 
              IF (INZ.LE.LMAX) GOTO 500 
                 LMAX =INZ 
                 XNZSUB(K) =JSTRT
C-----------------------------------------------------------        
C       ������������ � RCHLNK ��������� L(*,I) �� NZSUB.
C-----------------------------------------------------------                
500           RCHM = K
           DO 700 J = JSTRT, JSTOP
              NABOR = NZSUB(J) 
600           M = RCHM
              RCHM = RCHLNK(M) 
              IF (RCHM.LT.NABOR) GOTO 600 
              IF (RCHM.EQ.NABOR) GOTO 700 
                 KNZ = KNZ+1 
                 RCHLNK(M) = NABOR 
                 RCHLNK(NABOR) = RCHM 
                 RCHM = NABOR 
700           CONTINUE    
           GOTO 400  
C------------------------------------------------------
C    ��������� �� ������� ������� ������� �������
C------------------------------------------------------  
800     IF (KNZ.EQ.LMAX) GOTO 1400
C-------------------------------------------------
C    �����. �� ����� (�-1)-��� ������� ������ �-���.
C--------------------------------------------------
            IF (NZBEG.GT.NZEND) GOTO 1200 
               I = RCHLNK(K) 
               DO 900 JSTR=NZBEG,NZEND
                  IF (NZSUB(JSTRT)-I) 900, 1000, 1200 
900               CONTINUE
               GOTO 1200 
1000           XNZSUB(K) = JSTRT
               DO 1100 J=JSTRT,NZEND
                  IF (NZSUB(J).NE.I) GOTO 1200 
                  I = RCHLNK(I)
                  IF (I.GT.NEQNS) GOTO 1400 
1100           CONTINUE
               NZEND = JSTRT - 1 
C----------------------------------------
C    ��������� ��������� L(*, �) �� RCHLNK
C    � ��������� ������ (XNZSUB, NZSUB).
C----------------------------------------
1200        NZBEG = NZEND + 1
            NZEND = NZEND + KNZ 
            IF (NZEND.GT.MAXSUB) GOTO 1600 
            I = K
            DO 1300 J=NZBEG,NZEND 
               I = RCHLNK(I) 
               NZSUB(J)= I 
               MARKER(I) =K 
1300        CONTINUE 
            XNZSUB(K) = NZBEG 
            MARKER(K) = K
C--------------------------------------------------------
C    �������������� MRGLNK. ��������� L(*, �) �����������
C    ��� ����������� ������� L(*,J), ��� L(J, �) "������
C    ��������� ��������������� ������� � L(*,K).
C--------------------------------------------------------              
1400      IF (KNZ.LE.1) GOTO 1500
           KXSUB = XNZSUB(K) 
           I = NZSUB(KXSUB) 
           MRGLNK(K) = MRGLNK(I) 
           MRGLNK(I) = K 
1500    XLNZ(K+1) = XLNZ(K) + KNZ
        MAXLNZ =XLNZ(NEQNS) - 1
        MAXSUB = XNZSUB ( NEQNS ) 
        XNZSUB(NEQNS+1) = XNZSUB(NEQNS) 
        FLAG = 0 
        RETURN
C-----------------------------------------------------------
C    ������- ���� ������ ��� �������� ��������� ���������.
C---------------------------------------------------------
1600    FLAG = 1 
        RETURN 
        END        
C-----------------------------------------------------------------------------
C===================================================================
C      ������� ������ ������ ��� ��������� ������������
      subroutine FNENV (NEQNS,XADJ,ADJNCY,PERM,INVP,XENV,ENVSZE,
     >                   BANDW)

      INTEGER ADJNCY(1),INVP(1),PERM(1),XADJ(1),XENV(1),BANDW,ENVSZE
      integer str
      dimension str(100)
      integer pr/' '/,zn/'*'/
      
      BANDW=0
      ENVSZE=1
      DO 200 I=1,NEQNS
         XENV(I)=ENVSZE
         IPERM=PERM(I)
         JSTRT=XADJ(IPERM)
         JSTOP=XADJ(IPERM+1)-1
         IF(JSTOP.LT.JSTRT) GO TO 200
            IFIRST=I
            DO 100 J=JSTRT,JSTOP
               NABOR=ADJNCY(J)
               NABOR=INVP(NABOR)
               IF(NABOR.LT.IFIRST) IFIRST=NABOR
 100        CONTINUE
          IBAND=(I-IFIRST)
          ENVSZE=ENVSZE+IBAND
          IF (BANDW.LT.IBAND) BANDW=IBAND
 200  CONTINUE
      XENV(NEQNS+1)=ENVSZE
      ENVSZE=ENVSZE-1

      RETURN
      END
C==============================================================================
C  ����� ����� SMBFCT.for  
