# This Makefile is part of the NUPACK software suite
# Copyright (c) 2007 Caltech. All rights reserved.
# Coded by: Justin Bois 1/2007

# Makefile for basic executables that call functions from
# the partition functions for use in NUPACK

NUPACKHOME = ../../..
SHARED_DIR = ../../shared
CONSTANTS_DIR = $(SHARED_DIR)/constants
PFUNCUTILS_DIR = ../utils
LIB_DIR = $(NUPACKHOME)/lib
UTILS_LIB = utils
PFUNC_LIB = pfunc
RNG_LIB = mt19937
UTILS_LIB_FULL = lib$(UTILS_LIB).a
PFUNC_LIB_FULL = lib$(PFUNC_LIB).a
RNG_LIB_FULL = lib$(RNG_LIB).a
RNG_DIR = $(SHARED_DIR)/rng
BIN_DIR = $(NUPACKHOME)/bin
INCLUDES=-I$(PFUNCUTILS_DIR) -I$(CONSTANTS_DIR) -I$(SHARED_DIR) -I$(RNG_DIR)
#         -I$(DESIGN_DIR)
LIBS= -L$(LIB_DIR) -l$(PFUNC_LIB) -l$(UTILS_LIB) -l$(RNG_LIB) \
      $(NUPACK_LIBS) -lm

CFLAGS = $(NUPACK_CFLAGS) $(NUPACK_SELECTION_FLAGS) $(INCLUDES)

BASIC_DEPEND =  $(SHARED_DIR)/utils.o \
 $(SHARED_DIR)/utilsHeader.h\
 $(PFUNCUTILS_DIR)/pfuncUtilsHeader.h\
 $(PFUNCUTILS_DIR)/backtrack.o \
 $(PFUNCUTILS_DIR)/CalculateEnergy.o \
 $(PFUNCUTILS_DIR)/ene.o \
 $(PFUNCUTILS_DIR)/GetEnergy.o \
 $(PFUNCUTILS_DIR)/init.o \
 $(PFUNCUTILS_DIR)/mfeUtils.o \
 $(PFUNCUTILS_DIR)/min.o \
 $(PFUNCUTILS_DIR)/nsStar.o \
 $(PFUNCUTILS_DIR)/pairsPr.o \
 $(PFUNCUTILS_DIR)/pf.o \
 $(PFUNCUTILS_DIR)/pfuncUtils.o \
 $(PFUNCUTILS_DIR)/pknots.o \
 $(PFUNCUTILS_DIR)/ReadCommandLineNPK.o \
 $(PFUNCUTILS_DIR)/sumexp.o \
 $(PFUNCUTILS_DIR)/sumexp_pk.o \
 $(PFUNCUTILS_DIR)/pfuncUtilsConstants.h \
 $(PFUNCUTILS_DIR)/DNAExternals.h \
 $(PFUNCUTILS_DIR)/DNAGlobals.o \
 $(CONSTANTS_DIR)/runtime_constants.h \
 $(CONSTANTS_DIR)/physical_constants.h \
 $(LIB_DIR)/$(UTILS_LIB_FULL) \
 $(LIB_DIR)/$(PFUNC_LIB_FULL) \
 $(LIB_DIR)/$(RNG_LIB_FULL)

BASIC_OBJ = $(SHARED_DIR)/utils.o \
  $(SHARED_DIR)/hash.o \
  $(PFUNCUTILS_DIR)/backtrack.o \
  $(PFUNCUTILS_DIR)/CalculateEnergy.o \
  $(PFUNCUTILS_DIR)/ene.o \
  $(PFUNCUTILS_DIR)/GetEnergy.o \
  $(PFUNCUTILS_DIR)/init.o \
  $(PFUNCUTILS_DIR)/mfeUtils.o \
  $(PFUNCUTILS_DIR)/min.o \
  $(PFUNCUTILS_DIR)/nsStar.o \
  $(PFUNCUTILS_DIR)/nupackMPI.o \
  $(PFUNCUTILS_DIR)/pairsPr.o \
  $(PFUNCUTILS_DIR)/pf.o \
  $(PFUNCUTILS_DIR)/pfuncUtils.o \
  $(PFUNCUTILS_DIR)/pknots.o \
  $(PFUNCUTILS_DIR)/ReadCommandLineNPK.o \
  $(PFUNCUTILS_DIR)/sumexp.o \
  $(PFUNCUTILS_DIR)/sumexp_pk.o \
  $(PFUNCUTILS_DIR)/DNAGlobals.o \


SAMPLE_BINARIES = $(BIN_DIR)/sample
.PHONY: all
all: $(BIN_DIR)/.exist $(BIN_DIR)/count $(BIN_DIR)/energy $(BIN_DIR)/mfe \
$(BIN_DIR)/defect $(BIN_DIR)/pfunc $(BIN_DIR)/pairs $(BIN_DIR)/prob \
$(BIN_DIR)/subopt $(MPI_BINARIES) $(SAMPLE_BINARIES)

$(BIN_DIR)/.exist:
	mkdir -p $(BIN_DIR)
	touch $(BIN_DIR)/.exist	

$(BIN_DIR)/count: count.o $(BASIC_DEPEND)
	$(CC) $(CFLAGS) count.o \
          -o $@ $(LIBS) 

$(BIN_DIR)/energy: energy.o $(BASIC_DEPEND)
	$(CC) $(CFLAGS) energy.o \
           -o $@ $(LIBS)

$(BIN_DIR)/mfe: mfe.o $(BASIC_DEPEND)
	$(CC) $(CFLAGS) mfe.o \
           -o $@ $(LIBS) 

$(BIN_DIR)/defect: defect.o $(BASIC_DEPEND)
	$(CC) $(CFLAGS) defect.o \
           -o $@ $(LIBS) 

$(BIN_DIR)/pfunc: pfunc.o $(BASIC_DEPEND)
	$(CC) $(CFLAGS) pfunc.o \
           -o $@ $(LIBS) 

$(BIN_DIR)/pairs: pairs.o $(BASIC_DEPEND)
	$(CC) $(CFLAGS) pairs.o \
           -o $@ $(LIBS) 

$(BIN_DIR)/prob: prob.o $(BASIC_DEPEND)
	$(CC) $(CFLAGS) prob.o \
           -o $@ $(LIBS) 

$(BIN_DIR)/subopt: subopt.o $(BASIC_DEPEND)
	$(CC) $(CFLAGS) subopt.o \
           -o $@ $(LIBS) 
$(BIN_DIR)/sample: sample.o $(BASIC_DEPEND)
	$(CC) $(CFLAGS) sample.o \
           -o $@ $(LIBS) 

clean:
	rm -f *o
	rm -f $(BIN_DIR)/count \
				$(BIN_DIR)/energy \
				$(BIN_DIR)/mfe \
				$(BIN_DIR)/defect \
				$(BIN_DIR)/pfunc \
				$(BIN_DIR)/pairs \
				$(BIN_DIR)/prob \
				$(BIN_DIR)/subopt \
				$(BIN_DIR)/test_pf\
				$(BIN_DIR)/mfe_mpi\
				$(BIN_DIR)/pfunc_mpi\
				$(BIN_DIR)/pairs_mpi\
				$(BIN_DIR)/utils_mpi
	rm -f *~ 

