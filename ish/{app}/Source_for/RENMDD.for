C  ���� RENMDD.for   
C �������� ������������ RENMDD
C =============================================================
C     �O��PO�PAMMA �EPEH�MEPA��� ���OB
C ���������� �� MAIN,B���BAET MO���� GENQMD,STSM,GENRCM
C =================================================================
C ================ ������ ���� RENMDD ==============================    

       subroutine RENMDD ( NP,NE,NCN,NOP,PERM,INVP,XADJ,ADJNCY,IPR,
     >CORD,ESIGMA,FL,deg,marker,RCHESET,NBRHD,QSIZE,QLINK,ADJNCYBC)

       INTEGER NOP(1),XADJ(1),ADJNCY(1), PERM(1),FL,
     > INVP(1),XENV(6000),MASK(5000),XLC(5000),CORD(1),ESIGMA(1),
     > deg(1),marker(1),RCHESET(1),NBRHD(1),
     > QSIZE(1),QLINK(1), ADJNCYBC(1)
       LOGICAL*1 IPR(1)
       
       INTEGER XLNZ(np+1),MAXLNZ,XNZSUB(np+1),NZSUB(500000),MAXSUB,
     > RCHLNK(NP),MRGLNK(NP),XMARKER(NP),XFLAG 
     
       INTEGER N,BANDW,ENVSZE
     
       MAXSUB=500000
       
       XADJ(1)=1
C------------------------------------------------------------------------------       
C      �����:  ��������� ��������� - �� � ��� ����.       
       IF(IPR(10)) THEN
              PRINT 1,NP,NE  
              PRINT 7,(I,(NOP(NCN*(I-1)+J),J=1,NCN),I=1,NE)
       ENDIF     
C------------------------------------------------------------------------------      
C------------------------------------------------------------------------------
C      ������������ ��������� ��������� �����                                                                                          
       IF(IPR(26))WRITE(6,2) 
       CALL STSM (NP,NE,NCN,NOP,XADJ,ADJNCY)
       IF(IPR(26))WRITE(6,3)
       IF(IPR(11)) THEN
              PRINT 4
              DO K=1,NP
                 JB=XADJ(K)
                 JE=XADJ(K+1)-1
                 PRINT 5,XADJ(K),(ADJNCY(J),J=JB,JE)
              ENDDO
              PRINT 6,XADJ(NP+1)
       ENDIF    
C------------------------------------------------------------------------------
C      ��� ������������       
       IF (FL.EQ.-2.OR.FL.EQ.-4.OR.FL.EQ.31) THEN
          GOTO 3421
       ENDIF 
C------------------------------------------------------------------------------   
C      ����� ��������� ������������� (�� �������� FL)    
C------------------------------------------------------------------------------
C      �������� �����       
       IF (FL.EQ.40.OR.FL.EQ.41.OR.FL.EQ.42) THEN
          IF (IPR(26)) WRITE(6,8) 
          CALL GENKNG (NP,XADJ,ADJNCY,PERM)
          IF (IPR(26)) WRITE(6,9)
          IF(IPR(13)) PRINT 22,(K,PERM(K),K=1,NP)  !����� ������/����� �����         
          GOTO 333
       ENDIF           
C------------------------------------------------------------------------------
C      �������� ������
      IF (FL.EQ.50.OR.FL.EQ.51.OR.FL.EQ.52) THEN
          IF (IPR(26)) WRITE(6,10)
          CALL GENRZN (NP,XADJ,ADJNCY,PERM)
          IF (IPR(26)) WRITE(6,11)
          IF(IPR(13)) PRINT 22,(K, PERM(K), K=1, NP) 
          GOTO 333
       ENDIF        
C------------------------------------------------------------------------------       
C      �������� �������(������) � ����
       IF (FL.EQ.21.OR.FL.EQ.22.OR.FL.EQ.35) THEN
          IF (IPR(26)) WRITE (6,12)      
          CALL GENAU(NP, XADJ, ADJNCY, PERM)
          IF (IPR(26)) WRITE (6,13)
          IF(IPR(13)) PRINT 22,(K, PERM(K), K=1, NP) 
          GOTO 333
       ENDIF
C------------------------------------------------------------------------------        
C       �������� ����������� �������
        IF (FL.EQ.2.OR.FL.EQ.3.OR.FL.EQ.36) THEN
          IF (IPR(26)) WRITE (6,14)
          call GENQMD(np,XADJ,ADJNCY,ADJNCYBC,PERM,INVP,DEG,
     1            MARKER,RCHSET,NBRHD,QSIZE,QLINK,NOFSB)        
          IF (IPR(26)) WRITE (6,15)          
          IF(IPR(13)) PRINT 22,(K,PERM(K),K=1,NP)
          GOTO 333 
        ENDIF
C------------------------------------------------------------------------------               
C       �������� �������-�����
        IF (FL.EQ.0.OR.FL.EQ.1.OR.FL.EQ.11.OR.FL.EQ.12.OR.
     >                              FL.EQ.33.OR.FL.EQ.34) THEN
          IF (IPR(26)) WRITE(6,16)
          CALL GENRCM( NP,XADJ,ADJNCY,PERM,MASK,XLC,FL)                
          IF (IPR(26)) WRITE(6,17)
          IF(IPR(13)) PRINT 22,(K,PERM(K),K=1,NP)
          GOTO 333
        ENDIF
C------------------------------------------------------------------------------                                                                                              
C       ��� ���������� ���������� ������������  
3421    IF (IPR(26)) WRITE(6,18)
        DO IJ=1,NP
           PERM(IJ)=IJ
        ENDDO                                                                                                                                                                                                                                                                                
C-----------------------------------------------------------------------------       
333     DO IJ=1,NP
          INVP(PERM(IJ))=IJ
        ENDDO
C-----------------------------------------------------------------------------
C      ������ ������ ������ ���� ��������
        IF(IPR(12)) PRINT 21,(K,INVP(K),K=1,NP)
        IF (IPR(30)) THEN
        WRITE (6,853)
853     FORMAT(10X,'-----start MEMCNT--------',/,/)
        CALL MEMCNT (NP,XADJ,ADJNCY,PERM,INVP)
        WRITE (6,854)
854     FORMAT(10X,'-----finish MEMCNT--------',/,/)
        ENDIF
C-----------------------------------------------------------------------------
c             HOB�M HOMEPAM - �X KOOP��HAT�
       DO 81 I=1,NP
       DO 81 J=1,2
 81    ESIGMA(2*(I-1)+J)=CORD(2*(I-1)+J)
       DO 82 I=1,NP
       DO 82 J=1,2
 82    CORD(2*(INVP(I)-1)+J)=ESIGMA(2*(I-1)+J)
C-----------------------------------------------------------------------------
C            �PEO�PA�OBAH�E NOP
       DO 71 IEL=1,NE
       DO 71 I=1,NCN
 71    NOP(NCN*(IEL-1)+I)=INVP(NOP(NCN*(IEL-1)+I))
C-----------------------------------------------------------------------------
C          PRINT 20,(NN,(NOP(NCN*(NN-1)+J),J=1,NCN),
C    >        (INVP(NOP(NCN*(NN-1)+J)),J=1,NCN),NN=1,NE)
C     IF(IPR(14)) PRINT 23,(NN,( INVP(NOP(NCN*(NN-1)+J)),J=1,NCN),NN=1,N
C     CALL FNENV ( NP,XADJ,ADJNCY,PERM,INVP,XENV,ENVSZE,BANDW)
C     REWIND NT2
C     WRITE(NT2)((INVP (NOP(NCN*(I-1)+J)),J=1,NCN),I=1,NE)
C     IF(IPR(  ))  PRINT 18,(XENV(I),I=1,NP)
C     IF(IPR(  ))  PRINT 19,ENVSZE,BANDW    
C-----------------------------------------------------------------------------
C      ��������������� �����
1      FORMAT(/,5X,'����������: ���OB',I5,2X,'��EMEHTOB',I5)
2      FORMAT(/,10X,'*****Start STSM in RENMDD',/,
     >10X,'(������������ ��������� ��������� )',/)
3      FORMAT(/,10X,'*****Finish STSM in RENMDD')
4      FORMAT(/14X, '��������� ���������',/
     >6X,'K',6X,'XADJ',15X,'ADJNCY')
5      FORMAT(2X,I5,4X,I5,3X,20I5)
6      FORMAT(/'  ���HA MACC�BA <<ADJNCY>>',I10)
7      FORMAT(/' ��������� ��������� ����� (������� � ��� ����)',
     >2X,' MACC�B <<NOP>>'/(3('  *N',I3,'(' ,3I4,')')))
8      FORMAT(/, 10X, '*****Start GENKNG in RENMDD', /,/,
     >5X,'*************************************************',
     > '*******',/,5X,'*',54X,'*',/,
     >5X,'*  ����������� ������� ������������ ���������� ',
     > '�����   *',/,5X,'*',54X,'*',/,
     >5X,'*****************************************',
     > '***************',/)
9      FORMAT(/, 10X, '*****Finish GENKNG in RENMDD')
10      FORMAT(/, 10X, '*****Start GENKNG in RENMDD', /,/,
     >5X,'*************************************************',
     > '*******',/,5X,'*',54X,'*',/,
     >5X,'*  ����������� ������� ������������ ���������M ',
     > '������  *',/,5X,'*',54X,'*',/,
     >5X,'*****************************************',
     > '***************',/)
11      FORMAT(/, 10X, '*****Finish GENRZN in RENMDD')
12      FORMAT(/, 10X, '*****Start GENKNG in RENMDD', /,/,
     >5X,'*************************************************',
     > '*******',/,5X,'*',54X,'*',/,
     >5X,'*      ����������� ������� ������������ ����������     *',/,
     >5X,'*              ������� (������) � ����                 *',/,
     > 5X,'*',54X,'*',/,
     >5X,'*****************************************',
     > '***************',/)
13      FORMAT(/, 10X, '*****Finish GENAU in RENMDD')
14      FORMAT(/, 10X, '*****Start GENKNG in RENMDD', /,/,
     >5X,'*************************************************',
     > '*******',/,5X,'*',54X,'*',/,
     >5X,'*      ����������� ������� ������������ ����������     *',/,
     >5X,'*                 ����������� �������                  *',/,
     > 5X,'*',54X,'*',/,
     >5X,'*****************************************',
     > '***************',/)
15      FORMAT(/, 10X, '*****Finish GENQMD in RENMDD')
16      FORMAT(/, 10X, '*****Start GENKNG in RENMDD', /,/,
     >5X,'*************************************************',
     > '*******',/,5X,'*',54X,'*',/,
     >5X,'*      ����������� ������� ������������ ����������     *',/,
     >5X,'*                  �������� - �����                    *',/,
     > 5X,'*',54X,'*',/,
     >5X,'*****************************************',
     > '***************',/)
17      FORMAT(/, 10X, '*****Finish GENRCM in RENMDD')
18      FORMAT(/, 10X, '*****Start GENKNG in RENMDD', /,/,
     >5X,'*************************************************',
     > '*******',/,5X,'*',54X,'*',/,
     >5X,'*          ��������� ���������� ������ ��������� ',
     > '      *',/,5X,'*',54X,'*',/,
     >5X,'*****************************************',
     > '***************',/)
19      FORMAT(/'  PA�MEP O�O�O�K� -',I5,'   ��P�HA �EHT� -',I5)
20      FORMAT(/'    N   CTAP�E *NOP*   HOB�E  *NOP*   '/(7I5))
21      FORMAT(/'  +OLD+ +NEW+ +OLD+ +NEW+ +OLD+ +NEW+      '/(6I6))
22      FORMAT(/'  +NEW+ +OLD+ +NEW+ +OLD+ +NEW+ +OLD+      '/(6I6))
23      FORMAT(/'  HOB�E  <<NOP>>'/(4('  N',I4,' (',3I5,'  )')))
24      FORMAT(/'  MACC�B XENV'/(10I5))       
       RETURN
C      DEBUG UNIT(9),INIT
       END
C =============================================================
C ================= ����� ���� RENMDD============================
C =============================================================
C  ����� ����� RENMDD.for
