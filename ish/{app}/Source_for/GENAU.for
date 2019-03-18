C=============================================================================
C  ���� GENAU.for
C  �������� ������������ GENAU, FIND_BETTA, FIND_NEW_BETTA,COUNT_NUM,CHANGE
C  ���������� �� ������ RENMDD 
C             ��������� �.�. - 2012 -      
c-----------------------------------------------------------------------------
c       �������� ������� � ���� (��������� ����� ����������� ������� ������������ ����� �����)
C-----------------------------------------------------------------------------        
C  ������� ������:
C          NP - ���������� �����
C          XADJ, ADJNCY - ��������� ��������� �����
C  �������� ������:
C           Perm - ������ ������������  
C-----------------------------------------------------------------------------
C-----------------------------------------------------------------------------
        SUBROUTINE GENAU(NP,XADJ,ADJNCY,PERM)
        INTEGER NP,ADJNCY(1),XADJ(1),PERM(1)
        INTEGER ADJLST(NP,NP-1),COUNT(NP),QLST(NP)
        INTEGER BETTA,COUNT_LE,COUNT_EQ,COUNT_EQ_N
C-----------------------------------------------------------------------------
C       ������� �������� ������ ������������        
        DO I=1,NP
           PERM(I)=I
        ENDDO        
c       ��������� ������ ��������� ������                
        DO I=1,NP
           N=0       !��� ��� ���� �������, �� � ������� ��� ������� 2 �������
           DO J=XADJ(I),XADJ(I+1)-1
              ADJLST(I,N+1)=ADJNCY(J)
              N=N+1
           ENDDO
           COUNT(I)=N !��������� ������ ������ ����� �� �������
           IF(ADJLST(I,1).LT.I)THEN
              QLST(I)=I-ADJLST(I,1)
           ELSE 
              QLST(I)=0
           ENDIF 
        ENDDO 
C-----------------------------------------------------------------------------        
50      COUNT_LE=0    ! ���-�� ������������ ��� ���������� ������� ������
        COUNT_EQ=0    ! ���-�� ������������ ��� ���������� ������� ������
        BETTA=FIND_BETTA(NP,QLST)  !������� ������� ������ 
100     J=1
        K=NP
        FLAG=0   ! ���� ��� ������ ������� � ����� � ��������  
C-----------------------------------------------------------------------------               
        DO 200 I=1,NP-1
           IF(FLAG.EQ.0) THEN ! ������ � ������� ������
           !������������ ����������� ����������� ����������� ������� �����
               CALL CHANGE(NP,ADJLST,COUNT,QLST,J,J+1,
     >                           BETTA,COUNT_LE,COUNT_EQ,PERM)                                  
               J=J+1
               FLAG=1     !������ ���� ��� ����� ����������� ������
               GOTO 200
           ENDIF
           IF(FLAG.EQ.1) THEN  ! ������ � ������ ������            
           !������������ ����������� ����������� ����������� ������� �����
               CALL CHANGE(NP,ADJLST,COUNT,QLST,K,K-1,
     >                           BETTA,COUNT_LE,COUNT_EQ,PERM)                                      
               K=K-1
               FLAG=0       !������ ���� ��� ����� ����������� ������
               GOTO 200
           ENDIF
200     CONTINUE  
C-----------------------------------------------------------------------------
        IF(COUNT_LE.EQ.0) THEN  !���� ���� ������������ ��� ������. ��. ������
           IF (COUNT_EQ.EQ.0) GOTO 300  !���� �� ������. ��� ����������
           COUNT_EQ_N=COUNT_EQ_N+1
           ! �������� �� ���-�� ������ �� ����������� ��. ������
           IF (COUNT_EQ_N.GT.INT(3+NP/100)) GOTO 300
           GOTO 50  ! � ��. �������
        ENDIF
        COUNT_EQ_N=0
        GOTO  50  ! � ��. �������
300     RETURN
        END
C-----------------------------------------------------------------------------
C-----------------------------------------------------------------------------        
C     ������������ ������������ �����        
        SUBROUTINE CHANGE(NP,ADJLST,COUNT,QLST,
     >                        X1,X2,BETTA,COUNT_LE,COUNT_EQ,PERM)
        INTEGER NP,ADJLST(NP,NP-1),COUNT(NP),QLST(NP),X1,X2,BETTA
        INTEGER COUNT_LE,COUNT_EQ,PERM(NP),TEMP
        ! �������� ������ � ������� �������
        CALL FIND_NEW_BETTA (NP,QLST,ADJLST,COUNT,X1,X2)
        ! ���� ����� ��. ������ ������ ������ 
        IF (FIND_BETTA(NP,QLST).GT.BETTA) THEN
           ! ����� �������� ������ � ������� �������
           CALL FIND_NEW_BETTA (NP,QLST,ADJLST,COUNT,X1,X2)            
           RETURN   
        ENDIF
        ! ���� ����� ��. ������ ������ ������
        IF (FIND_BETTA(NP,QLST).LT.BETTA) THEN
           ! ����� ������ ������� ��. ������ �� �����
           BETTA=FIND_BETTA(NP,QLST)
           ! �������� ������� ������������ ��� ���������� ��. ������
           COUNT_LE=COUNT_LE+1
           ! ������ ���� � ������� ������������
           TEMP=PERM(X1)
           PERM(X1)=PERM(X2)
           PERM(X2)=TEMP
           RETURN
        ENDIF
         ! ���� ������ � ������ ���-��� ������ ����� ����� � �����������
        IF (COUNT_NUM(NP,ADJLST,COUNT,X1).GE.
     >            COUNT_NUM(NP,ADJLST,COUNT,X2))THEN     
            !���������� �������       
           CALL FIND_NEW_BETTA (NP,QLST,ADJLST,COUNT,X1,X2)
           RETURN 
        ENDIF
        ! ����� ������ � ������� ���-��� ������ ����� ������ �� �����������
        BETTA=FIND_BETTA(NP,QLST)
        ! �������� ������� ����-�� ������������ ������������� ��. ������
        COUNT_EQ=COUNT_EQ+1
        ! �������� ������������ � ������� �����������
        TEMP=PERM(X1)
        PERM(X1)=PERM(X2)
        PERM(X2)=TEMP
        RETURN 
        END
C-----------------------------------------------------------------------------        
C-----------------------------------------------------------------------------
C       ������� ���������� ������� ������ ����� �������
        FUNCTION FIND_BETTA(NP,QLST)
        INTEGER NP,QLST(NP)        
        FIND_BETTA=0
        DO I=1,NP
           FIND_BETTA=FIND_BETTA+QLST(I)   
        ENDDO     
        RETURN
        END 
C-----------------------------------------------------------------------------
C-----------------------------------------------------------------------------
C       ������������ ������������ ����� � ��������� ��������� ���������
        SUBROUTINE FIND_NEW_BETTA (NP,QLST,ADJLST,COUNT,X1,X2)
        INTEGER NP,QLST(NP),ADJLST(NP,NP-1),COUNT(NP),X1,X2       
         ! ������ ��������� ���������
        CALL CHANGEADJLST(ADJLST,NP,COUNT,X1,X2)
         ! ������ ��������� ������� ������ �����
        DO I=1,NP
           IF(ADJLST(I,1).LT.I)THEN
              QLST(I)=I-ADJLST(I,1)
           ELSE 
              QLST(I)=0
           ENDIF 
        ENDDO   
        RETURN
        END
C-----------------------------------------------------------------------------
C-----------------------------------------------------------------------------        
C       ������������ �������� ���-�� ������ � �����       
        FUNCTION COUNT_NUM(NP,ADJLST,COUNT,N)
        INTEGER NP,ADJLST(NP,NP-1),COUNT(NP),N
        COUNT_NUM=0
        DO I=1,COUNT(N)
           IF (ADJLST(N,I).GE.N) RETURN 
           COUNT_NUM=COUNT_NUM+1       
        ENDDO       
        RETURN 
        END 
C-----------------------------------------------------------------------------
C==============================================================================
C  ����� ����� GENAU.for 