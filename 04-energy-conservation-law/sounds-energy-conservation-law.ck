// Author: Elohim
// program name: sounds-energy-coservation-law.ck
/*
* A short description of energy conservation law:
*/

// 'time' represent an absolute point in tiem (from the beginning of ChucK time).
// 'dur' represent a duration (with the same logical units as 'time').
   
// A duration of one second
1::second => dur oneSecond;

// A point in time (duration of foo from now)
now + foo => time laterOneSecond;

// 0.5 second is a quarter
0.5::second => dur quarter;

// 4 quarter is whole
4::quarter => dur whole;

// Operations on 'time' and 'duration' (arithmetic)

// example 1 (time offset):
// time + dur yields time
now + 10::second => time timeOfsset;

// example 2 (time subtraction):
// time - time yields dur
laterTenSeconds - now => dur timeSubstraction;

// example 3 (addition):
// dur + dur yields dur
10::second + 100::samp => dur addition;

// example 4 (subtraction):
// dur - dur yields dur
10::second + 100::samp => dur subtraction;

// example 5 (division):
// dur / dur yields number 
10::second / 20::ms => float division;

// example 6 (time mod):
// time mod dur yields dur
now % 1::second => dur remainder;

// example 7 (syncronize to period):
// syncronize to period of 0.5 second
0.5::second dur T;
T - (now % T) => now;

// example 8 (comparison on time):
// compare time and time
if (t1 < t2) {
   // do something
} 

// example 9 (comparison on duration):
// compare dur and dur
if (900::ms < 1::second) {
    // do something
}



