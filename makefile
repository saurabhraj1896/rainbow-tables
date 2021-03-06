OBJS    = mainRT.o createRT.o blake256.o rainbowAttack.o
OUT1    = rt.out
OUT2    = attack.out
CC      = gcc
CPP		= g++
FLAGS   = -g3 -O3 -Wall

all: rainbow

rainbow: $(OBJS)
	$(CC) -o $(OUT1) mainRT.o createRT.o blake256.o $(FLAGS) -fopenmp
	$(CPP) -std=c++11 -o $(OUT2) rainbowAttack.o createRT.o blake256.o $(FLAGS) 

rainbowAttack.o: rainbowAttack.cpp createRT.c blake.h createRT.h
	$(CPP) -std=c++11 -c rainbowAttack.cpp -O3

mainRT.o: mainRT.c createRT.c blake.h createRT.h
	$(CC) -c mainRT.c -O3 -fopenmp

createRT.o: createRT.c blake.h createRT.h
	$(CC) -c createRT.c -O3 -fopenmp

blake256.o: blake256.c blake.h
	$(CC) -c blake256.c -O3


# Clean House 
clean:
	rm -f *.o $(OUT1) $(OUT2)
clena:
	rm -f *.o $(OUT1) $(OUT2)
claen:
	rm -f *.o $(OUT1) $(OUT2)

