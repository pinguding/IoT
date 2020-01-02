EXE = IoT
CXX = g++
CFLAGS = -std=c++11 -O3 -g
OBJS = main.o parser.o filter.o ibi.o plot.o run.o fft.o ar.o LinearRegression.o


$(EXE) : $(OBJS)
		   $(CXX) -o $@ $(OBJS)

main.o : main.cpp iot.h
		$(CXX) $(CFLAGS) -c -o $@ $<

parser.o : parser.cpp iot.h
		$(CXX) $(CFLAGS) -c -o $@ $<

filter.o : filter.cpp iot.h
		$(CXX) $(CFLAGS) -c -o $@ $<

ibi.o : ibi.cpp iot.h
		$(CXX) $(CFLAGS) -c -o $@ $<

plot.o : makeplot.cpp iot.h
		$(CXX) $(CFLAGS) -c -o $@ $<

run.o : run.cpp iot.h
		$(CXX) $(CFLAGS) -c -o $@ $<

fft.o : fft.cpp iot.h
		$(CXX) $(CFLAGS) -c -o $@ $<

ar.o : ar.cpp iot.h
		$(CXX) $(CFLAGS) -c -o $@ $<

LinearRegression.o : LinearRegression.cpp iot.h
		$(CXX) $(CFLAGS) -c -o $@ $<

.PHONY: sub1-11
sub1-11: $(EXE)
		./$(EXE) ../data/sub1/day1/BVP/BVP_1.csv

.PHONY: sub1-12
sub1-12: $(EXE)
		./$(EXE) ../data/sub1/day1/BVP/BVP_2.csv

.PHONY: sub1-13
sub1-13: $(EXE)
		./$(EXE) ../data/sub1/day1/BVP/BVP_3.csv

.PHONY: sub1-21
sub1-21: $(EXE)
		./$(EXE) ../data/sub1/day2/BVP/BVP_1.csv

.PHONY: sub1-22
sub1-22: $(EXE)
		./$(EXE) ../data/sub1/day2/BVP/BVP_2.csv

.PHONY: sub1-23
sub1-23: $(EXE)
		./$(EXE) ../data/sub1/day2/BVP/BVP_3.csv

.PHONY: sub1-31
sub1-31: $(EXE)
		./$(EXE) ../data/sub1/day3/BVP/BVP_1.csv

.PHONY: sub1-32
sub1-32: $(EXE)
		./$(EXE) ../data/sub1/day3/BVP/BVP_2.csv

.PHONY: sub1-33
sub1-33: $(EXE)
		./$(EXE) ../data/sub1/day3/BVP/BVP_3.csv

.PHONY: sub1-41
sub1-41: $(EXE)
		./$(EXE) ../data/sub1/day4/BVP/BVP_1.csv

.PHONY: sub1-42
sub1-42: $(EXE)
		./$(EXE) ../data/sub1/day4/BVP/BVP_2.csv

.PHONY: sub1-43
sub1-43: $(EXE)
		./$(EXE) ../data/sub1/day4/BVP/BVP_3.csv

.PHONY: sub1-51
sub1-51: $(EXE)
		./$(EXE) ../data/sub1/day5/BVP/BVP_1.csv

.PHONY: sub1-52
sub1-52: $(EXE)
		./$(EXE) ../data/sub1/day5/BVP/BVP_2.csv

.PHONY: sub1-53
sub1-53: $(EXE)
		./$(EXE) ../data/sub1/day5/BVP/BVP_3.csv

.PHONY: sub1-61
sub1-61: $(EXE)
		./$(EXE) ../data/sub1/day6/BVP/BVP_1.csv

.PHONY: sub1-62
sub1-62: $(EXE)
		./$(EXE) ../data/sub1/day6/BVP/BVP_2.csv

.PHONY: sub1-63
sub1-63: $(EXE)
		./$(EXE) ../data/sub1/day6/BVP/BVP_3.csv

.PHONY: sub1-71
sub1-71: $(EXE)
		./$(EXE) ../data/sub1/day7/BVP/BVP_1.csv

.PHONY: sub1-72
sub1-72: $(EXE)
		./$(EXE) ../data/sub1/day7/BVP/BVP_2.csv

.PHONY: sub1-73
sub1-73: $(EXE)
		./$(EXE) ../data/sub1/day7/BVP/BVP_3.csv

.PHONY: sub2-11
sub2-11: $(EXE)
		./$(EXE) ../data/sub2/day1/BVP/BVP_1.csv

.PHONY: sub2-12
sub2-12: $(EXE)
		./$(EXE) ../data/sub2/day1/BVP/BVP_2.csv

.PHONY: sub2-13
sub2-13: $(EXE)
		./$(EXE) ../data/sub2/day1/BVP/BVP_3.csv

.PHONY: sub2-21
sub2-21: $(EXE)
		./$(EXE) ../data/sub2/day2/BVP/BVP_1.csv

.PHONY: sub2-22
sub2-22: $(EXE)
		./$(EXE) ../data/sub2/day2/BVP/BVP_2.csv

.PHONY: sub2-23
sub2-23: $(EXE)
		./$(EXE) ../data/sub2/day2/BVP/BVP_3.csv

.PHONY: sub2-31
sub2-31: $(EXE)
		./$(EXE) ../data/sub2/day3/BVP/BVP_1.csv

.PHONY: sub2-32
sub2-32: $(EXE)
		./$(EXE) ../data/sub2/day3/BVP/BVP_2.csv

.PHONY: sub2-33
sub2-33: $(EXE)
		./$(EXE) ../data/sub2/day3/BVP/BVP_3.csv

.PHONY: sub2-41
sub2-41: $(EXE)
		./$(EXE) ../data/sub2/day4/BVP/BVP_1.csv

.PHONY: sub2-42
sub2-42: $(EXE)
		./$(EXE) ../data/sub2/day4/BVP/BVP_2.csv

.PHONY: sub2-43
sub2-43: $(EXE)
		./$(EXE) ../data/sub2/day4/BVP/BVP_3.csv

.PHONY: sub2-51
sub2-51: $(EXE)
		./$(EXE) ../data/sub2/day5/BVP/BVP_1.csv

.PHONY: sub2-52
sub2-52: $(EXE)
		./$(EXE) ../data/sub2/day5/BVP/BVP_2.csv

.PHONY: sub2-53
sub2-53: $(EXE)
		./$(EXE) ../data/sub2/day5/BVP/BVP_3.csv

.PHONY: sub2-61
sub2-61: $(EXE)
		./$(EXE) ../data/sub2/day6/BVP/BVP_1.csv

.PHONY: sub2-62
sub2-62: $(EXE)
		./$(EXE) ../data/sub2/day6/BVP/BVP_2.csv

.PHONY: sub2-63
sub2-63: $(EXE)
		./$(EXE) ../data/sub2/day6/BVP/BVP_3.csv

.PHONY: sub2-71
sub2-71: $(EXE)
		./$(EXE) ../data/sub2/day7/BVP/BVP_1.csv

.PHONY: sub2-72
sub2-72: $(EXE)
		./$(EXE) ../data/sub2/day7/BVP/BVP_2.csv

.PHONY: sub2-73
sub2-73: $(EXE)
		./$(EXE) ../data/sub2/day7/BVP/BVP_3.csv

.PHONY: sub4-11
sub4-11: $(EXE)
		./$(EXE) ../data/sub4/day1/BVP/BVP_1.csv

.PHONY: sub4-12
sub4-12: $(EXE)
		./$(EXE) ../data/sub4/day1/BVP/BVP_2.csv

.PHONY: sub4-13
sub4-13: $(EXE)
		./$(EXE) ../data/sub4/day1/BVP/BVP_3.csv

.PHONY: sub4-21
sub4-21: $(EXE)
		./$(EXE) ../data/sub4/day2/BVP/BVP_1.csv

.PHONY: sub4-22
sub4-22: $(EXE)
		./$(EXE) ../data/sub4/day2/BVP/BVP_2.csv

.PHONY: sub4-23
sub4-23: $(EXE)
		./$(EXE) ../data/sub4/day2/BVP/BVP_3.csv

.PHONY: sub4-31
sub4-31: $(EXE)
		./$(EXE) ../data/sub4/day3/BVP/BVP_1.csv

.PHONY: sub4-32
sub4-32: $(EXE)
		./$(EXE) ../data/sub4/day3/BVP/BVP_2.csv

.PHONY: sub4-33
sub4-33: $(EXE)
		./$(EXE) ../data/sub4/day3/BVP/BVP_3.csv

.PHONY: sub4-41
sub4-41: $(EXE)
		./$(EXE) ../data/sub4/day4/BVP/BVP_1.csv

.PHONY: sub4-42
sub4-42: $(EXE)
		./$(EXE) ../data/sub4/day4/BVP/BVP_2.csv

.PHONY: sub4-43
sub4-43: $(EXE)
		./$(EXE) ../data/sub4/day4/BVP/BVP_3.csv

.PHONY: sub4-51
sub4-51: $(EXE)
		./$(EXE) ../data/sub4/day5/BVP/BVP_1.csv

.PHONY: sub4-52
sub4-52: $(EXE)
		./$(EXE) ../data/sub4/day5/BVP/BVP_2.csv

.PHONY: sub4-53
sub4-53: $(EXE)
		./$(EXE) ../data/sub4/day5/BVP/BVP_3.csv

.PHONY: sub4-61
sub4-61: $(EXE)
		./$(EXE) ../data/sub4/day6/BVP/BVP_1.csv

.PHONY: sub4-62
sub4-62: $(EXE)
		./$(EXE) ../data/sub4/day6/BVP/BVP_2.csv

.PHONY: sub4-63
sub4-63: $(EXE)
		./$(EXE) ../data/sub4/day6/BVP/BVP_3.csv

.PHONY: sub4-71
sub4-71: $(EXE)
		./$(EXE) ../data/sub4/day7/BVP/BVP_1.csv

.PHONY: sub4-72
sub4-72: $(EXE)
		./$(EXE) ../data/sub4/day7/BVP/BVP_2.csv

.PHONY: sub4-73
sub4-73: $(EXE)
		./$(EXE) ../data/sub4/day7/BVP/BVP_3.csv


.PHONY: sub5-11
sub5-11: $(EXE)
		./$(EXE) ../data/sub5/day1/BVP/BVP_1.csv

.PHONY: sub5-12
sub5-12: $(EXE)
		./$(EXE) ../data/sub5/day1/BVP/BVP_2.csv

.PHONY: sub5-13
sub5-13: $(EXE)
		./$(EXE) ../data/sub5/day1/BVP/BVP_3.csv

.PHONY: sub5-14
sub5-14: $(EXE)
		./$(EXE) ../data/sub5/day1/BVP/BVP_4.csv

.PHONY: sub5-15
sub5-15: $(EXE)
		./$(EXE) ../data/sub5/day1/BVP/BVP_5.csv

.PHONY: sub5-16
sub5-16: $(EXE)
		./$(EXE) ../data/sub5/day1/BVP/BVP_6.csv

.PHONY: sub5-21
sub5-21: $(EXE)
		./$(EXE) ../data/sub5/day2/BVP/BVP_1.csv

.PHONY: sub5-22
sub5-22: $(EXE)
		./$(EXE) ../data/sub5/day2/BVP/BVP_2.csv

.PHONY: sub5-23
sub5-23: $(EXE)
		./$(EXE) ../data/sub5/day2/BVP/BVP_3.csv

.PHONY: sub5-24
sub5-24: $(EXE)
		./$(EXE) ../data/sub5/day2/BVP/BVP_4.csv

.PHONY: sub5-25
sub5-25: $(EXE)
		./$(EXE) ../data/sub5/day2/BVP/BVP_5.csv

.PHONY: sub5-26
sub5-26: $(EXE)
		./$(EXE) ../data/sub5/day2/BVP/BVP_6.csv

.PHONY: sub5-31
sub5-31: $(EXE)
		./$(EXE) ../data/sub5/day3/BVP/BVP_1.csv

.PHONY: sub5-32
sub5-32: $(EXE)
		./$(EXE) ../data/sub5/day3/BVP/BVP_2.csv

.PHONY: sub5-33
sub5-33: $(EXE)
		./$(EXE) ../data/sub5/day3/BVP/BVP_3.csv

.PHONY: sub5-34
sub5-34: $(EXE)
		./$(EXE) ../data/sub5/day3/BVP/BVP_4.csv

.PHONY: sub5-35
sub5-35: $(EXE)
		./$(EXE) ../data/sub5/day3/BVP/BVP_5.csv

.PHONY: sub5-36
sub5-36: $(EXE)
		./$(EXE) ../data/sub5/day3/BVP/BVP_6.csv

.PHONY: sub5-41
sub5-41: $(EXE)
		./$(EXE) ../data/sub5/day4/BVP/BVP_1.csv

.PHONY: sub5-42
sub5-42: $(EXE)
		./$(EXE) ../data/sub5/day4/BVP/BVP_2.csv

.PHONY: sub5-43
sub5-43: $(EXE)
		./$(EXE) ../data/sub5/day4/BVP/BVP_3.csv

.PHONY: sub5-44
sub5-44: $(EXE)
		./$(EXE) ../data/sub5/day4/BVP/BVP_4.csv

.PHONY: sub5-45
sub5-45: $(EXE)
		./$(EXE) ../data/sub5/day4/BVP/BVP_5.csv

.PHONY: sub5-46
sub5-46: $(EXE)
		./$(EXE) ../data/sub5/day4/BVP/BVP_6.csv

.PHONY: sub5-51
sub5-51: $(EXE)
		./$(EXE) ../data/sub5/day5/BVP/BVP_1.csv

.PHONY: sub5-52
sub5-52: $(EXE)
		./$(EXE) ../data/sub5/day5/BVP/BVP_2.csv

.PHONY: sub5-53
sub5-53: $(EXE)
		./$(EXE) ../data/sub5/day5/BVP/BVP_3.csv

.PHONY: sub5-54
sub5-54: $(EXE)
		./$(EXE) ../data/sub5/day5/BVP/BVP_4.csv

.PHONY: sub5-55
sub5-55: $(EXE)
		./$(EXE) ../data/sub5/day5/BVP/BVP_5.csv

.PHONY: sub5-56
sub5-56: $(EXE)
		./$(EXE) ../data/sub5/day5/BVP/BVP_6.csv

.PHONY: sub5-61
sub5-61: $(EXE)
		./$(EXE) ../data/sub5/day6/BVP/BVP_1.csv

.PHONY: sub5-62
sub5-62: $(EXE)
		./$(EXE) ../data/sub5/day6/BVP/BVP_2.csv

.PHONY: sub5-63
sub5-63: $(EXE)
		./$(EXE) ../data/sub5/day6/BVP/BVP_3.csv

.PHONY: sub5-64
sub5-64: $(EXE)
		./$(EXE) ../data/sub5/day6/BVP/BVP_4.csv

.PHONY: sub5-65
sub5-65: $(EXE)
		./$(EXE) ../data/sub5/day6/BVP/BVP_5.csv

.PHONY: sub5-66
sub5-66: $(EXE)
		./$(EXE) ../data/sub5/day6/BVP/BVP_6.csv

.PHONY: sub5-71
sub5-71: $(EXE)
		./$(EXE) ../data/sub5/day7/BVP/BVP_1.csv

.PHONY: sub5-72
sub5-72: $(EXE)
		./$(EXE) ../data/sub5/day7/BVP/BVP_2.csv

.PHONY: sub5-73
sub5-73: $(EXE)
		./$(EXE) ../data/sub5/day7/BVP/BVP_3.csv

.PHONY: sub5-74
sub5-74: $(EXE)
		./$(EXE) ../data/sub5/day7/BVP/BVP_4.csv

.PHONY: sub5-75
sub5-75: $(EXE)
		./$(EXE) ../data/sub5/day7/BVP/BVP_5.csv

.PHONY: sub5-76
sub5-76: $(EXE)
		./$(EXE) ../data/sub5/day7/BVP/BVP_6.csv

.PHONY: sub6-11
sub6-11: $(EXE)
		./$(EXE) ../data/sub6/day1/BVP/BVP_1.csv

.PHONY: sub6-12
sub6-12: $(EXE)
		./$(EXE) ../data/sub6/day1/BVP/BVP_2.csv

.PHONY: sub6-13
sub6-13: $(EXE)
		./$(EXE) ../data/sub6/day1/BVP/BVP_3.csv

.PHONY: sub6-14
sub6-14: $(EXE)
		./$(EXE) ../data/sub6/day1/BVP/BVP_4.csv

.PHONY: sub6-15
sub6-15: $(EXE)
		./$(EXE) ../data/sub6/day1/BVP/BVP_5.csv

.PHONY: sub6-16
sub6-16: $(EXE)
		./$(EXE) ../data/sub6/day1/BVP/BVP_6.csv

.PHONY: sub6-21
sub6-21: $(EXE)
		./$(EXE) ../data/sub6/day2/BVP/BVP_1.csv

.PHONY: sub6-22
sub6-22: $(EXE)
		./$(EXE) ../data/sub6/day2/BVP/BVP_2.csv

.PHONY: sub6-23
sub6-23: $(EXE)
		./$(EXE) ../data/sub6/day2/BVP/BVP_3.csv

.PHONY: sub6-24
sub6-24: $(EXE)
		./$(EXE) ../data/sub6/day2/BVP/BVP_4.csv

.PHONY: sub6-25
sub6-25: $(EXE)
		./$(EXE) ../data/sub6/day2/BVP/BVP_5.csv

.PHONY: sub6-26
sub6-26: $(EXE)
		./$(EXE) ../data/sub6/day2/BVP/BVP_6.csv

.PHONY: sub6-31
sub6-31: $(EXE)
		./$(EXE) ../data/sub6/day3/BVP/BVP_1.csv

.PHONY: sub6-32
sub6-32: $(EXE)
		./$(EXE) ../data/sub6/day3/BVP/BVP_2.csv

.PHONY: sub6-33
sub6-33: $(EXE)
		./$(EXE) ../data/sub6/day3/BVP/BVP_3.csv

.PHONY: sub6-34
sub6-34: $(EXE)
		./$(EXE) ../data/sub6/day3/BVP/BVP_4.csv

.PHONY: sub6-35
sub6-35: $(EXE)
		./$(EXE) ../data/sub6/day3/BVP/BVP_5.csv

.PHONY: sub6-36
sub6-36: $(EXE)
		./$(EXE) ../data/sub6/day3/BVP/BVP_6.csv

.PHONY: sub6-41
sub6-41: $(EXE)
		./$(EXE) ../data/sub6/day4/BVP/BVP_1.csv

.PHONY: sub6-42
sub6-42: $(EXE)
		./$(EXE) ../data/sub6/day4/BVP/BVP_2.csv

.PHONY: sub6-43
sub6-43: $(EXE)
		./$(EXE) ../data/sub6/day4/BVP/BVP_3.csv

.PHONY: sub6-44
sub6-44: $(EXE)
		./$(EXE) ../data/sub6/day4/BVP/BVP_4.csv

.PHONY: sub6-45
sub6-45: $(EXE)
		./$(EXE) ../data/sub6/day4/BVP/BVP_5.csv

.PHONY: sub6-46
sub6-46: $(EXE)
		./$(EXE) ../data/sub6/day4/BVP/BVP_6.csv

.PHONY: sub6-51
sub6-51: $(EXE)
		./$(EXE) ../data/sub6/day5/BVP/BVP_1.csv

.PHONY: sub6-52
sub6-52: $(EXE)
		./$(EXE) ../data/sub6/day5/BVP/BVP_2.csv

.PHONY: sub6-53
sub6-53: $(EXE)
		./$(EXE) ../data/sub6/day5/BVP/BVP_3.csv

.PHONY: sub6-54
sub6-54: $(EXE)
		./$(EXE) ../data/sub6/day5/BVP/BVP_4.csv

.PHONY: sub6-55
sub6-55: $(EXE)
		./$(EXE) ../data/sub6/day5/BVP/BVP_5.csv

.PHONY: sub6-56
sub6-56: $(EXE)
		./$(EXE) ../data/sub6/day5/BVP/BVP_6.csv

.PHONY: sub6-61
sub6-61: $(EXE)
		./$(EXE) ../data/sub6/day6/BVP/BVP_1.csv

.PHONY: sub6-62
sub6-62: $(EXE)
		./$(EXE) ../data/sub6/day6/BVP/BVP_2.csv

.PHONY: sub6-63
sub6-63: $(EXE)
		./$(EXE) ../data/sub6/day6/BVP/BVP_3.csv

.PHONY: sub6-64
sub6-64: $(EXE)
		./$(EXE) ../data/sub6/day6/BVP/BVP_4.csv

.PHONY: sub6-65
sub6-65: $(EXE)
		./$(EXE) ../data/sub6/day6/BVP/BVP_5.csv

.PHONY: sub6-66
sub6-66: $(EXE)
		./$(EXE) ../data/sub6/day6/BVP/BVP_6.csv

.PHONY: sub6-71
sub6-71: $(EXE)
		./$(EXE) ../data/sub6/day7/BVP/BVP_1.csv

.PHONY: sub6-72
sub6-72: $(EXE)
		./$(EXE) ../data/sub6/day7/BVP/BVP_2.csv

.PHONY: sub6-73
sub6-73: $(EXE)
		./$(EXE) ../data/sub6/day7/BVP/BVP_3.csv

.PHONY: sub6-74
sub6-74: $(EXE)
		./$(EXE) ../data/sub6/day7/BVP/BVP_4.csv

.PHONY: sub6-75
sub6-75: $(EXE)
		./$(EXE) ../data/sub6/day7/BVP/BVP_5.csv

.PHONY: sub6-76
sub6-76: $(EXE)
		./$(EXE) ../data/sub6/day7/BVP/BVP_6.csv

.PHONY: sub7-11
sub7-11: $(EXE)
		./$(EXE) ../data/sub7/day1/BVP/BVP_1.csv

.PHONY: sub7-12
sub7-12: $(EXE)
		./$(EXE) ../data/sub7/day1/BVP/BVP_2.csv

.PHONY: sub7-21
sub7-21: $(EXE)
		./$(EXE) ../data/sub7/day2/BVP/BVP_1.csv

.PHONY: sub7-22
sub7-22: $(EXE)
		./$(EXE) ../data/sub7/day2/BVP/BVP_2.csv

.PHONY: sub7-23
sub7-23: $(EXE)
		./$(EXE) ../data/sub7/day2/BVP/BVP_3.csv

.PHONY: sub7-24
sub7-24: $(EXE)
		./$(EXE) ../data/sub7/day2/BVP/BVP_4.csv

.PHONY: sub7-25
sub7-25: $(EXE)
		./$(EXE) ../data/sub7/day2/BVP/BVP_5.csv

.PHONY: sub7-26
sub7-26: $(EXE)
		./$(EXE) ../data/sub7/day2/BVP/BVP_6.csv

.PHONY: sub7-31
sub7-31: $(EXE)
		./$(EXE) ../data/sub7/day3/BVP/BVP_1.csv

.PHONY: sub7-32
sub7-32: $(EXE)
		./$(EXE) ../data/sub7/day3/BVP/BVP_2.csv

.PHONY: sub7-33
sub7-33: $(EXE)
		./$(EXE) ../data/sub7/day3/BVP/BVP_3.csv

.PHONY: sub7-34
sub7-34: $(EXE)
		./$(EXE) ../data/sub7/day3/BVP/BVP_4.csv

.PHONY: sub7-35
sub7-35: $(EXE)
		./$(EXE) ../data/sub7/day3/BVP/BVP_5.csv

.PHONY: sub7-36
sub7-36: $(EXE)
		./$(EXE) ../data/sub7/day3/BVP/BVP_6.csv

.PHONY: sub7-41
sub7-41: $(EXE)
		./$(EXE) ../data/sub7/day4/BVP/BVP_1.csv

.PHONY: sub7-42
sub7-42: $(EXE)
		./$(EXE) ../data/sub7/day4/BVP/BVP_2.csv

.PHONY: sub7-43
sub7-43: $(EXE)
		./$(EXE) ../data/sub7/day4/BVP/BVP_3.csv

.PHONY: sub7-44
sub7-44: $(EXE)
		./$(EXE) ../data/sub7/day4/BVP/BVP_4.csv

.PHONY: sub7-45
sub7-45: $(EXE)
		./$(EXE) ../data/sub7/day4/BVP/BVP_5.csv

.PHONY: sub7-46
sub7-46: $(EXE)
		./$(EXE) ../data/sub7/day4/BVP/BVP_6.csv

.PHONY: sub7-51
sub7-51: $(EXE)
		./$(EXE) ../data/sub7/day5/BVP/BVP_1.csv

.PHONY: sub7-52
sub7-52: $(EXE)
		./$(EXE) ../data/sub7/day5/BVP/BVP_2.csv

.PHONY: sub7-53
sub7-53: $(EXE)
		./$(EXE) ../data/sub7/day5/BVP/BVP_3.csv

.PHONY: sub7-54
sub7-54: $(EXE)
		./$(EXE) ../data/sub7/day5/BVP/BVP_4.csv

.PHONY: sub7-61
sub7-61: $(EXE)
		./$(EXE) ../data/sub7/day6/BVP/BVP_1.csv

.PHONY: sub7-62
sub7-62: $(EXE)
		./$(EXE) ../data/sub7/day6/BVP/BVP_2.csv

.PHONY: sub7-63
sub7-63: $(EXE)
		./$(EXE) ../data/sub7/day6/BVP/BVP_3.csv

.PHONY: sub7-64
sub7-64: $(EXE)
		./$(EXE) ../data/sub7/day6/BVP/BVP_4.csv

.PHONY: sub7-65
sub7-65: $(EXE)
		./$(EXE) ../data/sub7/day6/BVP/BVP_5.csv

.PHONY: sub7-66
sub7-66: $(EXE)
		./$(EXE) ../data/sub7/day6/BVP/BVP_6.csv

.PHONY: sub7-71
sub7-71: $(EXE)
		./$(EXE) ../data/sub7/day7/BVP/BVP_1.csv

.PHONY: sub7-72
sub7-72: $(EXE)
		./$(EXE) ../data/sub7/day7/BVP/BVP_2.csv

.PHONY: sub7-73
sub7-73: $(EXE)
		./$(EXE) ../data/sub7/day7/BVP/BVP_3.csv

.PHONY: sub7-74
sub7-74: $(EXE)
		./$(EXE) ../data/sub7/day7/BVP/BVP_4.csv

.PHONY: sub7-75
sub7-75: $(EXE)
		./$(EXE) ../data/sub7/day7/BVP/BVP_5.csv

.PHONY: sub7-76
sub7-76: $(EXE)
		./$(EXE) ../data/sub7/day7/BVP/BVP_6.csv

.PHONY: sub8-11
sub8-11: $(EXE)
		./$(EXE) ../data/sub8/day1/BVP/BVP_1.csv

.PHONY: sub8-12
sub8-12: $(EXE)
		./$(EXE) ../data/sub8/day1/BVP/BVP_2.csv

.PHONY: sub8-13
sub8-13: $(EXE)
		./$(EXE) ../data/sub8/day1/BVP/BVP_3.csv

.PHONY: sub8-14
sub8-14: $(EXE)
		./$(EXE) ../data/sub8/day1/BVP/BVP_4.csv

.PHONY: sub8-21
sub8-21: $(EXE)
		./$(EXE) ../data/sub8/day2/BVP/BVP_1.csv

.PHONY: sub8-22
sub8-22: $(EXE)
		./$(EXE) ../data/sub8/day2/BVP/BVP_2.csv

.PHONY: sub8-23
sub8-23: $(EXE)
		./$(EXE) ../data/sub8/day2/BVP/BVP_3.csv

.PHONY: sub8-24
sub8-24: $(EXE)
		./$(EXE) ../data/sub8/day2/BVP/BVP_4.csv

.PHONY: sub8-25
sub8-25: $(EXE)
		./$(EXE) ../data/sub8/day2/BVP/BVP_5.csv

.PHONY: sub8-26
sub8-26: $(EXE)
		./$(EXE) ../data/sub8/day2/BVP/BVP_6.csv

.PHONY: sub8-31
sub8-31: $(EXE)
		./$(EXE) ../data/sub8/day3/BVP/BVP_1.csv

.PHONY: sub8-32
sub8-32: $(EXE)
		./$(EXE) ../data/sub8/day3/BVP/BVP_2.csv

.PHONY: sub8-33
sub8-33: $(EXE)
		./$(EXE) ../data/sub8/day3/BVP/BVP_3.csv

.PHONY: sub8-34
sub8-34: $(EXE)
		./$(EXE) ../data/sub8/day3/BVP/BVP_4.csv

.PHONY: sub8-35
sub8-35: $(EXE)
		./$(EXE) ../data/sub8/day3/BVP/BVP_5.csv

.PHONY: sub8-36
sub8-36: $(EXE)
		./$(EXE) ../data/sub8/day3/BVP/BVP_6.csv

.PHONY: sub8-41
sub8-41: $(EXE)
		./$(EXE) ../data/sub8/day4/BVP/BVP_1.csv

.PHONY: sub8-42
sub8-42: $(EXE)
		./$(EXE) ../data/sub8/day4/BVP/BVP_2.csv

.PHONY: sub8-43
sub8-43: $(EXE)
		./$(EXE) ../data/sub8/day4/BVP/BVP_3.csv

.PHONY: sub8-44
sub8-44: $(EXE)
		./$(EXE) ../data/sub8/day4/BVP/BVP_4.csv

.PHONY: sub8-45
sub8-45: $(EXE)
		./$(EXE) ../data/sub8/day4/BVP/BVP_5.csv

.PHONY: sub8-46
sub8-46: $(EXE)
		./$(EXE) ../data/sub8/day4/BVP/BVP_6.csv

.PHONY: sub8-51
sub8-51: $(EXE)
		./$(EXE) ../data/sub8/day5/BVP/BVP_1.csv

.PHONY: sub8-52
sub8-52: $(EXE)
		./$(EXE) ../data/sub8/day5/BVP/BVP_2.csv

.PHONY: sub8-53
sub8-53: $(EXE)
		./$(EXE) ../data/sub8/day5/BVP/BVP_3.csv

.PHONY: sub8-54
sub8-54: $(EXE)
		./$(EXE) ../data/sub8/day5/BVP/BVP_4.csv

.PHONY: sub8-55
sub8-55: $(EXE)
		./$(EXE) ../data/sub8/day5/BVP/BVP_5.csv

.PHONY: sub8-56
sub8-56: $(EXE)
		./$(EXE) ../data/sub8/day5/BVP/BVP_6.csv

.PHONY: sub8-61
sub8-61: $(EXE)
		./$(EXE) ../data/sub8/day6/BVP/BVP_1.csv

.PHONY: sub8-62
sub8-62: $(EXE)
		./$(EXE) ../data/sub8/day6/BVP/BVP_2.csv

.PHONY: sub8-63
sub8-63: $(EXE)
		./$(EXE) ../data/sub8/day6/BVP/BVP_3.csv

.PHONY: sub8-64
sub8-64: $(EXE)
		./$(EXE) ../data/sub8/day6/BVP/BVP_4.csv

.PHONY: sub8-65
sub8-65: $(EXE)
		./$(EXE) ../data/sub8/day6/BVP/BVP_5.csv

.PHONY: sub8-66
sub8-66: $(EXE)
		./$(EXE) ../data/sub8/day6/BVP/BVP_6.csv

.PHONY: sub8-71
sub8-71: $(EXE)
		./$(EXE) ../data/sub8/day7/BVP/BVP_1.csv

.PHONY: sub8-72
sub8-72: $(EXE)
		./$(EXE) ../data/sub8/day7/BVP/BVP_2.csv

.PHONY: sub8-73
sub8-73: $(EXE)
		./$(EXE) ../data/sub8/day7/BVP/BVP_3.csv

.PHONY: sub8-74
sub8-74: $(EXE)
		./$(EXE) ../data/sub8/day7/BVP/BVP_4.csv

.PHONY: sub8-75
sub8-75: $(EXE)
		./$(EXE) ../data/sub8/day7/BVP/BVP_5.csv

.PHONY: sub8-76
sub8-76: $(EXE)
		./$(EXE) ../data/sub8/day7/BVP/BVP_6.csv

.PHONY: sub10-11
sub10-11: $(EXE)
		./$(EXE) ../data/sub10/day1/BVP/BVP_1.csv
		
.PHONY: sub10-12
sub10-12: $(EXE)
		./$(EXE) ../data/sub10/day1/BVP/BVP_2.csv

.PHONY: sub10-13
sub10-13: $(EXE)
		./$(EXE) ../data/sub10/day1/BVP/BVP_3.csv

.PHONY: sub10-14
sub10-14: $(EXE)
		./$(EXE) ../data/sub10/day1/BVP/BVP_4.csv

.PHONY: sub10-15
sub10-15: $(EXE)
		./$(EXE) ../data/sub10/day1/BVP/BVP_5.csv

.PHONY: sub10-16
sub10-16: $(EXE)
		./$(EXE) ../data/sub10/day1/BVP/BVP_6.csv

.PHONY: sub10-21
sub10-21: $(EXE)
		./$(EXE) ../data/sub10/day2/BVP/BVP_1.csv

.PHONY: sub10-22
sub10-22: $(EXE)
		./$(EXE) ../data/sub10/day2/BVP/BVP_2.csv

.PHONY: sub10-23
sub10-23: $(EXE)
		./$(EXE) ../data/sub10/day2/BVP/BVP_3.csv

.PHONY: sub10-24
sub10-24: $(EXE)
		./$(EXE) ../data/sub10/day2/BVP/BVP_4.csv

.PHONY: sub10-25
sub10-25: $(EXE)
		./$(EXE) ../data/sub10/day2/BVP/BVP_5.csv

.PHONY: sub10-26
sub10-26: $(EXE)
		./$(EXE) ../data/sub10/day2/BVP/BVP_6.csv

.PHONY: sub10-31
sub10-31: $(EXE)
		./$(EXE) ../data/sub10/day3/BVP/BVP_1.csv

.PHONY: sub10-32
sub10-32: $(EXE)
		./$(EXE) ../data/sub10/day3/BVP/BVP_2.csv

.PHONY: sub10-33
sub10-33: $(EXE)
		./$(EXE) ../data/sub10/day3/BVP/BVP_3.csv

.PHONY: sub10-34
sub10-34: $(EXE)
		./$(EXE) ../data/sub10/day3/BVP/BVP_4.csv

.PHONY: sub10-35
sub10-35: $(EXE)
		./$(EXE) ../data/sub10/day3/BVP/BVP_5.csv

.PHONY: sub10-36
sub10-36: $(EXE)
		./$(EXE) ../data/sub10/day3/BVP/BVP_6.csv

.PHONY: sub10-41
sub10-41: $(EXE)
		./$(EXE) ../data/sub10/day4/BVP/BVP_1.csv

.PHONY: sub10-42
sub10-42: $(EXE)
		./$(EXE) ../data/sub10/day4/BVP/BVP_2.csv

.PHONY: sub10-43
sub10-43: $(EXE)
		./$(EXE) ../data/sub10/day4/BVP/BVP_3.csv

.PHONY: sub10-44
sub10-44: $(EXE)
		./$(EXE) ../data/sub10/day4/BVP/BVP_4.csv

.PHONY: sub10-45
sub10-45: $(EXE)
		./$(EXE) ../data/sub10/day4/BVP/BVP_5.csv

.PHONY: sub10-46
sub10-46: $(EXE)
		./$(EXE) ../data/sub10/day4/BVP/BVP_6.csv

.PHONY: sub10-51
sub10-51: $(EXE)
		./$(EXE) ../data/sub10/day5/BVP/BVP_1.csv

.PHONY: sub10-52
sub10-52: $(EXE)
		./$(EXE) ../data/sub10/day5/BVP/BVP_2.csv

.PHONY: sub10-53
sub10-53: $(EXE)
		./$(EXE) ../data/sub10/day5/BVP/BVP_3.csv

.PHONY: sub10-54
sub10-54: $(EXE)
		./$(EXE) ../data/sub10/day5/BVP/BVP_4.csv

.PHONY: sub10-55
sub10-55: $(EXE)
		./$(EXE) ../data/sub10/day5/BVP/BVP_5.csv

.PHONY: sub10-56
sub10-56: $(EXE)
		./$(EXE) ../data/sub10/day5/BVP/BVP_6.csv

.PHONY: sub10-61
sub10-61: $(EXE)
		./$(EXE) ../data/sub10/day6/BVP/BVP_1.csv

.PHONY: sub10-62
sub10-62: $(EXE)
		./$(EXE) ../data/sub10/day6/BVP/BVP_2.csv

.PHONY: sub10-63
sub10-63: $(EXE)
		./$(EXE) ../data/sub10/day6/BVP/BVP_3.csv

.PHONY: sub10-64
sub10-64: $(EXE)
		./$(EXE) ../data/sub10/day6/BVP/BVP_4.csv

.PHONY: sub10-65
sub10-65: $(EXE)
		./$(EXE) ../data/sub10/day6/BVP/BVP_5.csv

.PHONY: sub10-66
sub10-66: $(EXE)
		./$(EXE) ../data/sub10/day6/BVP/BVP_6.csv

.PHONY: sub10-71
sub10-71: $(EXE)
		./$(EXE) ../data/sub10/day7/BVP/BVP_1.csv

.PHONY: sub10-72
sub10-72: $(EXE)
		./$(EXE) ../data/sub10/day7/BVP/BVP_2.csv

.PHONY: sub10-73
sub10-73: $(EXE)
		./$(EXE) ../data/sub10/day7/BVP/BVP_3.csv

.PHONY: sub10-74
sub10-74: $(EXE)
		./$(EXE) ../data/sub10/day7/BVP/BVP_4.csv

.PHONY: sub10-75
sub10-75: $(EXE)
		./$(EXE) ../data/sub10/day7/BVP/BVP_5.csv

.PHONY: sub10-76
sub10-76: $(EXE)
		./$(EXE) ../data/sub10/day7/BVP/BVP_6.csv

.PHONY: test1
test1 : $(EXE)
		./$(EXE) ./test_sets/test_1_BVP.csv

.PHONY: test2
test2 : $(EXE)
		./$(EXE) ./test_sets/test_2_BVP.csv

.PHONY: test3
test3 : $(EXE)
		./$(EXE) ./test_sets/test_3_BVP.csv

.PHONY: test4
test4 : $(EXE)
		./$(EXE) ./test_sets/test_4_BVP.csv

.PHONY: test5
test5 : $(EXE)
		./$(EXE) ./test_sets/test_5_BVP.csv

.PHONY: sub1
sub1 : 
			make sub1-11
			make sub1-12
			make sub1-13
			make sub1-21
			make sub1-22
			make sub1-23
			make sub1-31
			make sub1-32
			make sub1-33
			make sub1-41
			make sub1-42
			make sub1-43
			make sub1-51
			make sub1-52
			make sub1-53
			make sub1-61
			make sub1-62
			make sub1-63
			make sub1-71
			make sub1-72
			make sub1-73

.PHONY: sub2
sub2 : 
			make sub2-11
			make sub2-12
			make sub2-13
			make sub2-21
			make sub2-22
			make sub2-23
			make sub2-31
			make sub2-32
			make sub2-33
			make sub2-41
			make sub2-42
			make sub2-43
			make sub2-51
			make sub2-52
			make sub2-53
			make sub2-61
			make sub2-62
			make sub2-63
			make sub2-71
			make sub2-72
			make sub2-73

.PHONY: sub4
sub4 : 
			make sub4-11
			make sub4-12
			make sub4-13
			make sub4-21
			make sub4-22
			make sub4-23
			make sub4-31
			make sub4-32
			make sub4-33
			make sub4-41
			make sub4-42
			make sub4-43
			make sub4-51
			make sub4-52
			make sub4-53
			make sub4-61
			make sub4-63
			make sub4-71
			make sub4-72
			make sub4-73

.PHONY: sub5
sub5 : 
			make sub5-11
			make sub5-12
			make sub5-13
			make sub5-14
			make sub5-15
			make sub5-16
			make sub5-21
			make sub5-22
			make sub5-23
			make sub5-24
			make sub5-25
			make sub5-26
			make sub5-31
			make sub5-32
			make sub5-33
			make sub5-34
			make sub5-35
			make sub5-36
			make sub5-41
			make sub5-42
			make sub5-43
			make sub5-44
			make sub5-45
			make sub5-46
			make sub5-51
			make sub5-52
			make sub5-53
			make sub5-54
			make sub5-55
			make sub5-56
			make sub5-61
			make sub5-62
			make sub5-63
			make sub5-64
			make sub5-65
			make sub5-66
			make sub5-71
			make sub5-72
			make sub5-73
			make sub5-74
			make sub5-75
			make sub5-76

.PHONY: sub6
sub6 : 
			make sub6-11
			make sub6-12
			make sub6-13
			make sub6-14
			make sub6-15
			make sub6-16
			make sub6-21
			make sub6-22
			make sub6-23
			make sub6-24
			make sub6-25
			make sub6-26
			make sub6-31
			make sub6-32
			make sub6-33
			make sub6-34
			make sub6-35
			make sub6-36
			make sub6-41
			make sub6-42
			make sub6-43
			make sub6-44
			make sub6-45
			make sub6-46
			make sub6-51
			make sub6-52
			make sub6-53
			make sub6-54
			make sub6-55
			make sub6-56
			make sub6-61
			make sub6-62
			make sub6-63
			make sub6-64
			make sub6-65
			make sub6-66
			make sub6-71
			make sub6-72
			make sub6-73
			make sub6-74
			make sub6-75
			make sub6-76

.PHONY: sub7
sub7 : 
			make sub7-11
			make sub7-12
			make sub7-21
			make sub7-22
			make sub7-23
			make sub7-24
			make sub7-25
			make sub7-26
			make sub7-31
			make sub7-32
			make sub7-33
			make sub7-34
			make sub7-35
			make sub7-36
			make sub7-41
			make sub7-42
			make sub7-43
			make sub7-44
			make sub7-45
			make sub7-46
			make sub7-51
			make sub7-52
			make sub7-53
			make sub7-54
			make sub7-61
			make sub7-62
			make sub7-63
			make sub7-64
			make sub7-65
			make sub7-66
			make sub7-71
			make sub7-72
			make sub7-73
			make sub7-74
			make sub7-75
			make sub7-76

.PHONY: sub8
sub8 : 
			make sub8-11
			make sub8-12
			make sub8-13
			make sub8-14
			make sub8-21
			make sub8-22
			make sub8-23
			make sub8-24
			make sub8-25
			make sub8-26
			make sub8-31
			make sub8-32
			make sub8-33
			make sub8-34
			make sub8-35
			make sub8-36
			make sub8-41
			make sub8-42
			make sub8-43
			make sub8-44
			make sub8-45
			make sub8-46
			make sub8-51
			make sub8-52
			make sub8-53
			make sub8-54
			make sub8-55
			make sub8-56
			make sub8-61
			make sub8-62
			make sub8-63
			make sub8-64
			make sub8-65
			make sub8-66
			make sub8-71
			make sub8-72
			make sub8-73
			make sub8-74
			make sub8-75
			make sub8-76

.PHONY: sub10
sub10 : 
			make sub10-11
			make sub10-12
			make sub10-13
			make sub10-14
			make sub10-15
			make sub10-16
			make sub10-21
			make sub10-22
			make sub10-23
			make sub10-24
			make sub10-25
			make sub10-26
			make sub10-31
			make sub10-32
			make sub10-33
			make sub10-34
			make sub10-35
			make sub10-36
			make sub10-41
			make sub10-42
			make sub10-43
			make sub10-44
			make sub10-45
			make sub10-46
			make sub10-51
			make sub10-52
			make sub10-53
			make sub10-54
			make sub10-55
			make sub10-56
			make sub10-61
			make sub10-62
			make sub10-63
			make sub10-64
			make sub10-65
			make sub10-66
			make sub10-71
			make sub10-72
			make sub10-73
			make sub10-74
			make sub10-75
			make sub10-76
.PHONY: all_test
all_test: 
			make test1
			make test2
			make test3
			make test4
			make test5

.PHONY: clean
clean : 
		rm -f *.o
		rm -f $(EXE)

.PHONY: clean_plot
clean_plot :
		rm ./plot_file/*

.PHONY: clean_db
clean_db :
		rm ./*.db
