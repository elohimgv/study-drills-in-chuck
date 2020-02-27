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
*
* Reflection: Like in my first study drill, I didn't code kepler's laws. This 
* writing is about just a point of view and a pleasure while I do it to improve 
* my coding skills and reflect about something, is just that. 
*
* I will pass the laws to field of mind. Imagine the following: 
* -First law: The human behaviour (planetary orbits) is attached to an energie
* (sun) that spins him around her.
*
* -Second law: The human swep equa areas in equal times while turn around the 
* energie (sun). The human (planet) repeat the behaviour (pattern) while it is 
* near the energie (sun).
*
* -Third law: The human behaviour (orbital periods) grow in a scaled way with the 
* size of the ellipse such that the square of the orbital period is proportinal to
* the cube of the longest axis of the elliptical orbit (behaviour).
*/
 
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
 
function void playMelody() {
    0 => int cicle;
    while (cicle < 2) {
        0 => int counter; 
        while (counter < pattern.cap()) {
            if (pattern[counter] == 0) {
                noteTriWave(tempo_2, notes[0]);
            } else if (pattern[counter] == 1) {
                noteSqrWave(tempo_2, notes[1]);
            } else if (pattern[counter] == 2) {
                noteTriWave(tempo_2, notes[2]);
            } else if (pattern[counter] == 3) {
                noteSqrWave(tempo_2, notes[3]);
            } else if (pattern[counter] == 4) {
                noteTriWave(tempo_2, notes[4]);
            } else if (pattern[counter] == 5) {
                noteTriWave(tempo_2, notes[5]);
            } else if (pattern[counter] == 6) {
                noteSqrWave(tempo_2, notes[6]);
            } else if (pattern[counter] == 7) {
                noteTriWave(tempo_2, notes[7]);
            } else if (pattern[counter] == 8) {
                noteTriWave(tempo_2, notes[8]);
            } else {
                noteSqrWave(tempo_2, notes[9]);
            }
            counter++;
            <<<counter>>>;
         }
         cicle++;
     }
}

function void noteTriWave(dur t, int note) {
    // initializing wave
    TriOsc tri => dac;
    // Sound gain
    0.4 => tri.gain;
    // Set frequency
    Std.mtof(note) => tri.freq;
    // Advance time
    t => now;
    // Sound gain off
    0.0 => tri.gain;
}

function void noteSqrWave(dur t, int note) {
    // initializing wave
    SqrOsc sqr => dac;
    // Sound gain
    0.4 => sqr.gain;
    // Set frequency
    Std.mtof(note) => sqr.freq;
    // Advance time
    t => now;
    // Sound gain off
    0.0 => sqr.gain;
}

// MAIN PROGRAM
playMelody();

 
 