// Author: Elohim
// program name: sounds-keplers-laws.ck
/*
* A short description of kepler's laws:
*
* -First law: The planetary orbits are elliptical with the sun in a focu
*  (perihelion closer to sun, aphelion far to the sun).
*
* -Second law: The planet swep equal areas in equal times while turn 
*  around the sun. This law links speed with distance from the sun:  
*  the planet move faster when it is near the sun than when it is far from it.
*
* -Third law: The orbital periods grow in a scaled way with the size of the
*  ellipses such that the square of the orbital period is proportional to the 
*  cube of the longest axis of the elliptical orbit.
*/

// Sound network 
SqrOsc s => dac;
//TriOsc t => dac;

// notes: 50-0, 52-1, 54-2, 56-3, 59-4, 60-5
// 62-6, 63-7, 64-8, 65-9
[50, 52, 54, 56, 59, 60, 62, 63, 64, 65] @=> int notes[];
// Pattern to play the notes.
[1,8,0,0,0,0,
 1,8,0,4,2,2,
 1,8,0,8,4,3,
 1,8,1,7,2,6,
 1,8,2,1,4,7,
 1,8,2,6,0,8,
 1,8,3,0,2,9,
 1,8,3,4,5,0,
 1,8,3,9,1,1,
 1,8,4,3,3,1,
 1,8,4,7,5,1,
 1,8,5,2,1,1,
 1,8,5,6,3,0,
 1,9,0,0,4,9] @=> int pattern[];
 
 // Tempos
0.1::second => dur tempo_1;
0.2::second => dur tempo_2;
0.3::second => dur tempo_3;
0.4::second => dur tempo_4;
0.5::second => dur tempo_5;
0.6::second => dur tempo_6;
0.7::second => dur tempo_7;
0.8::second => dur tempo_8;
0.9::second => dur tempo_9;
 
// Sound gain
0.4 => s.gain;
 
function void playNotes() {
    0 => int cicle;
    while (cicle < 2) {
        0 => int counter; 
        while (counter < pattern.cap()) {
            if (pattern[counter] == 0) {
                Std.mtof(notes[0]) => s.freq;
                tempo(tempo_2);
            } else if (pattern[counter] == 1) {
                Std.mtof(notes[1]) => s.freq;
                tempo(tempo_2);
            } else if (pattern[counter] == 2) {
                Std.mtof(notes[2]) => s.freq;
                tempo(tempo_2);
            } else if (pattern[counter] == 3) {
                Std.mtof(notes[3]) => s.freq;
                tempo(tempo_2);
            } else if (pattern[counter] == 4) {
                Std.mtof(notes[4]) => s.freq;
                tempo(tempo_2);
            } else if (pattern[counter] == 5) {
                Std.mtof(notes[5]) => s.freq;
                tempo(tempo_2);
            } else if (pattern[counter] == 6) {
                Std.mtof(notes[6]) => s.freq;
                tempo(tempo_2);
            } else if (pattern[counter] == 7) {
                Std.mtof(notes[7]) => s.freq;
                tempo(tempo_2);
            } else if (pattern[counter] == 8) {
                Std.mtof(notes[8]) => s.freq;
                tempo(tempo_2);
            } else {
                Std.mtof(notes[9]) => s.freq;
                tempo(tempo_2); 
            }
            counter++;
            <<<counter>>>;
         }
         cicle++;
     }
}

function void tempo(dur t) {
    t => now;
}

// MAIN PROGRAM
playNotes();

 
 