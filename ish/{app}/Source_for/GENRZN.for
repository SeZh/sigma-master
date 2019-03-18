C=============================================================================
C  ���� GENRZN.for
C  �������� ������������ GENRZN, CHANGEADJLST, SORT
C  ���������� �� ������ RENMDD  
C             ��������� �.�. - 2012 -      
c-----------------------------------------------------------------------------
c       �������� ������  (��������� ����������������� ������� ������������ ����� �����)
C-----------------------------------------------------------------------------        
C  ������� ������:
C          NP - ���������� �����
C          XADJ, ADJNCY - ��������� ��������� �����
C  �������� ������:
C           Perm - ������ ������������  
C-----------------------------------------------------------------------------      
        SUBROUTINE GENRZN(NP,XADJ,ADJNCY,PERM) 
        INTEGER NP,XADJ(1),ADJNCY(1),PERM(1)
        INTEGER I,J,ADJLST(NP,NP-1),COUNT(NP),PMAX,PMIN,TOSWAP,TRY ,BETTA
C-----------------------------------------------------------------------------
C      COUNT(i) - ������ ����� ������� ������ ��� i-���� ����
C      ADJLST(i,j) - ������ �������� ������� ����, ��� i-���� ���� ������� ADJLST(i,j),j=1,�OUNT(i)        
C      PMAX - ���� � ������� ������� �� ���� ����� ���������� � ������������ ������ �����
C      PMIN - ���� � ������� ������� �� ���� ����� ���������� � ������������ ������ �����        
C      TOSWAP - ��������� ����� ��� ������������
C      TRY - ����� ���������� ����������� ������������
C      BETTA - ������ ����� ��� ������������� ����
C-----------------------------------------------------------------------------        
        TRY=100000   !���-�� ����������� ����������� ������������        
        DO I=1,NP
           PERM(I)=I   !������� ������ ������
        ENDDO
c       ��������� ������ ��������� ������                
        DO I=1,NP
           N=0       !��� ��� ���� �������, �� � ������� ��� ������� 2 �������
           DO J=XADJ(I),XADJ(I+1)-1
              ADJLST(I,N+1)=ADJNCY(J)
              N=N+1
           ENDDO
           COUNT(I)=N 
        ENDDO  
C---------------����� 1 
c        ������� ����������� ������ ����� � ���� ���������� � ���     
1       MAXLNT=0     !������������ ������
        PMAX=0       !���� � ������� �������
        PMIN=0       !���� � ������� �������         
        DO I=1,NP           
           IF ((ADJLST(I,1).LE.I).AND.((MAXLNT).LT.(I-ADJLST(I,1))))THEN
              MAXLNT=I-ADJLST(I,1)
              PMAX=I
              PMIN=ADJLST(I,1)
           ENDIF
        ENDDO          
c       ���� ���� � ������� ������� ����� ����������� � ������� �� � �.7        
        TOSWAP=0    !���������� ��� �������� ���� ��� ��������
        ! �������������� ��� ���� �� ���� � ������� ������� 
        DO 11 I=1,PMAX-1 
           IF (ADJLST(I,1).LT.I) THEN    !������ ����� ��� ���������� ����
              BETTA=I-ADJLST(I,1)
           ELSE
              BETTA=0
           ENDIF  
           !���� ����� ������ ������ ������������ �� ������ ����������  
           !����� ������ = ������ ���������� ���� + ������� �� �������
           IF (((BETTA+(PMAX-I)).LT.MAXLNT))THEN  
              TOSWAP=I
           ENDIF  
11      CONTINUE         
        IF (TOSWAP.NE.0) GOTO 7
C-----------------����� 2
C        ���� ���� � ������� ������� ����� ����������� � ������� �� � �.7                    
2       TOSWAP=0 
        ! ������� ���� ������� � ��������� �� �����
        DO 21 I=PMIN+1,NP
           IF (ADJLST(I,COUNT(I)).GT.I) THEN
              BETTA=ADJLST(I,COUNT(I))-I  !������ ������
           ELSE
              BETTA=0
           ENDIF                   
           IF ((BETTA+(I-PMIN)).LT.
     >        (ADJLST(PMIN,COUNT(PMIN))-PMIN).AND.
     >        ((I-ADJLST(PMIN,1)).LT.
     >        (ADJLST(PMIN,COUNT(PMIN))-PMIN))) THEN
                   TOSWAP=I 
                   GOTO 22
               ENDIF       
21      CONTINUE
22      PMAX=PMIN         
        IF (TOSWAP.NE.0) GOTO 7
        PMAX=OLDPMAX
C---------------- ����� 3
c        ���� ���� � ������� ������� ��� ������������ �������� � ������� 
c        ������ ����� ���������� �������
3       TOSWAP=0
        DO 31 I=1,PMAX-1 
           IF (ADJLST(I,1).LT.I) THEN   !������ ����� ����
              BETTA=I-ADJLST(I,1)
           ELSE
              BETTA=0
           ENDIF       
           IF (((BETTA+(PMAX-I)).EQ.MAXLNT))THEN
               TOSWAP=I 
           ENDIF  
31      CONTINUE          
        !���� �����, �� � �.6
        IF (TOSWAP.NE.0) GOTO 6 
CC---------------- ����� 4
c       ���� ���� � ������� ������� ��� ������������ �������� � �������
c       ������ ����� ��������� �������� 
        TOSWAP=0
        DO 41 I=PMIN+1,NP
           IF (ADJLST(I,COUNT(I)).GT.I) THEN
              BETTA=ADJLST(I,COUNT(I))-I
           ELSE
              BETTA=0
           ENDIF
           IF ((BETTA+(I-PMIN)).EQ.
     >    (ADJLST(PMIN,COUNT(PMIN))-PMIN).AND.
     >    ((I-ADJLST(PMIN,1)).LE.
     >     (ADJLST(PMIN,COUNT(PMIN))-PMIN))) THEN
              TOSWAP=I 
              GOTO 42
              ENDIF       
41      CONTINUE  
42      PMAX=PMIN  
        !���� ����� ������� �� � �.6      
        IF (TOSWAP.NE.0) GOTO 6
        PMAX=OLDPMAX
C---------------- ����� 5
5       GOTO 8    !��� ��������� ������������ �������: ������� - ���������
C---------------- ����� 6
!       ���� � �. 3 � �.4 ���� ������� ���� ����, ��� � �� ���������� ���� - �������
6       IF (OLDI.EQ.TOSWAP.AND.OLDP.EQ.PMAX) GOTO  5                  
        OLDI=TOSWAP    !�������� �������������� ����
        OLDP=PMAX 
C----------------����� 7 
!        ������ ��������� ��������� pmax � toswap - ���� ��� ������       
7       CALL CHANGEADJLST(ADJLST,NP,COUNT,PMAX,TOSWAP)
        !������ ���� � ������� ����������������
        TEMP=PERM(PMAX)
        PERM(PMAX)=PERM(TOSWAP)
        PERM(TOSWAP)=TEMP 
        TRY=TRY-1      ! ������ ����������� ������������
        IF (TRY.EQ.0) GOTO 5        
        GOTO 1   !��� ������
C----------------------- 
8       RETURN
        END
C-----------------------------------------------------------------------------        
C-----------------------------------------------------------------------------        
C       ������������ ��� ��������� ��������� ��������� �����
        SUBROUTINE CHANGEADJLST(ADJLST,NP,COUNT,P,II)
        INTEGER NP,ADJLST(NP,NP-1),COUNT(NP),P,II
        INTEGER COUNTCHG,TEMP ,I,J          
        ! �������� ������ ������� ����� 
        IF (COUNT(P).GE.COUNT(II)) THEN
           COUNTCHG=COUNT(P)
        ELSEIF (COUNT(P).LT.COUNT(II))  THEN
           COUNTCHG=COUNT(II)  
        ENDIF           
        DO J=1,COUNTCHG
           TEMP=ADJLST(P,J)
           ADJLST(P,J)=ADJLST(II,J)
           ADJLST(II,J)=TEMP
        ENDDO  
          !�������� ���-�� ����. ����� � ������� count
        TEMP=COUNT(P)
        COUNT(P)=COUNT(II)
        COUNT(II)=TEMP  
          !�������� ������� ���� ���� � ����������� ����� ��������� ���������
        DO I=1,NP
           COUNTCHG=0
           DO J=1,COUNT(I)
              IF (ADJLST(I,J).EQ.P) THEN
                 ADJLST(I,J)=II
                 COUNTCHG=1
              ELSEIF (ADJLST(I,J).EQ.II) THEN
                 ADJLST(I,J)=P
                 COUNTCHG=1
              ENDIF  
           ENDDO
           IF (COUNTCHG.EQ.1) THEN
              CALL SORT(ADJLST,I,COUNT(I),NP) !���� ������ ���������, �� �� ����������
           ENDIF
        ENDDO     
        RETURN
        END
C-----------------------------------------------------------------------------        
C       ������������ ���������� �������
        SUBROUTINE SORT(M,II,JJ,NP)
        INTEGER M(NP,NP-1),II,JJ,I,J,T        
        DO I=1,JJ
           DO J=1,JJ+1-I              
              IF(M(II,J).GE.M(II,JJ+1-I)) THEN
                  T=M(II,J)
                  M(II,J)=M(II,JJ+1-I)
                  M(II,JJ+1-I)=T
              ENDIF
           ENDDO
        ENDDO 
        RETURN
        END
C-----------------------------------------------------------------------------
C==============================================================================
C  ����� ����� GENRZN.for 