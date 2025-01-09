# List of source code file
obj = GRT.o Rayleigh.o util.o Love.o C_interval.o C_interval_L.o SearchRayleigh.o SearchLove.o surfdisp96.o surfmodes.o disp96.o

# Archive toll
AR = ar r
SURF_LIB = libsurfmodes.a

# Compiler
F90 = gfortran
F77FLAGS = -fPIC -O3 -ffree-line-length-0 -ffixed-line-length-0 -cpp
FFLAGS += -fPIC -O3 

# rule for building surface modes code
$(SURF_LIB): $(obj)
	$(AR) $@ $^
	#$(F90) -shared -fPIC -o $@ $(obj)

# rule for building object file
%.o : %.f90
	$(F90) $(FFLAGS) -c -o $@ $<

%.o : %.f
	$(F90) $(F77FLAGS) -c -o $@ $<

.PHONY: clean cleanall

clean: 
	rm -f *.o *.mod

cleanall: clean
	rm -f *.a
