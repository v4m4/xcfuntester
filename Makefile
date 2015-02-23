MY_ROOT=.
DEBUG=YES

TARGET=LINUX64

#############################################
#
#               Linux (64-bit)
#
#############################################


ifeq ($(TARGET),LINUX64)
   CPPFLAGS=
   RM = rm
   RMFLAGS = -f
   AR = ar
   ARFLAGS = -r
   OPT = -O3 
   CC=cc
   FC=gfortran
   COPT = $(OPT)
   FOPT = $(OPT)
   CFLAGS=-g $(COPT) -Wall $(INC)
   FFLAGS=-g $(FOPT) -O  $(INC) $(MPI)
   CPP=$(CC) -E
   ifeq ($(DEBUG),YES)
      CPPFLAGS+=-DDEBUG
   endif

   LD=$(CC)
   LD=$(FC)
   LDFLAGS=-g  
   LDFLAGS=-g  $(FOPT)
endif

#############################################
#
#               Custom
#
#############################################

ifeq ($(TARGET),CUSTOM)

endif

#############################################
#
#               End of Targets
#
#############################################

OBJECTS = array_initialize.o  \
          becke88_wrapper.o  \
          bnl_wrapper.o  \
          camb88_wrapper.o  \
          camlsd_wrapper.o  \
          campbe96_wrapper.o  \
          colorize.o  \
          cpbe96_wrapper.o  \
          dirac_wrapper.o  \
          hse08fx.o  \
          lyp88_wrapper.o  \
          numder_initialize.o  \
          output.o  \
          perdew86_wrapper.o  \
          pw91lda_wrapper.o  \
          var_init.o  \
          vwn_wrapper.o  \
          wpbe_wrapper.o  \
          xc_att_xc.o  \
          xc_becke88.o  \
          xc_bnl.o  \
          xc_camb88.o  \
          xc_camxlsd.o  \
          xc_camxpbe96.o  \
          xc_dirac.o  \
          xc_lyp88.o  \
          xc_pbe96.o  \
          xc_perdew86.o  \
          xc_pw91lda.o  \
          xc_vwn_num.o  \
          xc_wpbe.o  \
          xc_xpbe96.o  \
          xcfuntester.o  \
          xpbe96_wrapper.o  

all: xcfuntester.x 

refresh: realclean all


xcfuntester.x: $(OBJECTS)
	$(LD) $(LDFLAGS) $(OBJECTS) $(LIB) -o driver_$(TARGET).x


$%.o: %.F 
	$(FC) -c $(FFLAGS) $(INC) $< -o $@

clean:
	$(RM) $(RMFLAGS) *.o

realclean: clean
	$(RM) $(RMFLAGS) *.x *.a



