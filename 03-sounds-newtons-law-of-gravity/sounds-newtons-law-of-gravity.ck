// Author: Elohim
// program name: sounds-newtons-law-of-gravity.ck
/*
* A short description of newtons law of gravity:
*
* Its law argue the capacity of attraction between 
* bodies (mass) and said the force is proportional 
* to its masses. However, it is inversely proportional 
* to the square of the distance between the center of the bodies.
*
* My reflection: While a body is more solid, it has more
* attraction. Solid is synonym of density of matter; more
* density, more atoms with less space between them. Less
* density, more atoms with more space between them. 
*
* What happend in human mind? If you have a solid mind, your 
* mind is dense (matter) ...a little space to flow. Make your
* own conclusions. 
*/


// Sound chain
PulseOsc pulse => Pan2 panning => dac;

// pitch: 146-0, 164-1, 184-2, 207-3, 246-4, 261-5
// 293-6, 311-7, 329-8, 349-9
[146,164,184,207,246,261,293,311,329,349] @=> int myPitch[];

// Pattern to play the pitch.
[1,4,5,0,0,9,
 1,4,5,4,0,8,
 1,4,5,8,0,8,
 1,5,0,2,0,9,
 1,5,0,6,1,1,
 1,5,1,0,1,3,
 1,5,1,4,1,6,
 1,5,1,8,2,0,
 1,5,2,2,2,5,
 1,5,2,6,3,0,
 1,5,3,0,3,6,
 1,5,3,4,4,3,
 1,5,3,8,5,0,
 1,5,4,2,5,8,
 1,5,4,7,0,7,
 1,5,5,1,1,6,
 1,5,5,5,2,7,
 1,5,5,9,3,7,
 1,6,0,3,4,9,
 1,6,0,8,0,1] @=> int pattern[];
 
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

// Setting gain of pitch
0.4 => pulse.gain;
// Setting duty cicle 
Math.random2f(0.01, 0.7) => pulse.width;

function void playMelody() {
    0 => int cicle;
    do {
        0 => int counter; 
        while (counter < pattern.cap()) {
            if (pattern[counter] == 0) {
                playPitch(tempo_3, myPitch[0]);
            } else if (pattern[counter] == 1) {
                playPitch(tempo_2, myPitch[1]);
            } else if (pattern[counter] == 2) {
                playPitch(tempo_2, myPitch[2]);
            } else if (pattern[counter] == 3) {
                playPitch(tempo_2, myPitch[3]);
            } else if (pattern[counter] == 4) {
                playPitch(tempo_6, myPitch[4]);
            } else if (pattern[counter] == 5) {
                playPitch(tempo_4, myPitch[5]);
            } else if (pattern[counter] == 6) {
                playPitch(tempo_2, myPitch[6]);
            } else if (pattern[counter] == 7) {
                playPitch(tempo_2, myPitch[7]);
            } else if (pattern[counter] == 8) {
                playPitch(tempo_2, myPitch[8]);
            } else {
                playPitch(tempo_6, myPitch[9]);
            }
            // Pan position 
            Math.random2f(-1.0, 1.0) => panning.pan;
            counter++;
        }
        cicle++;
    } while (cicle < 1);
}

function void playPitch(dur tempo, int pitch) {
    if (pitch == 146 || pitch == 164 || pitch == 184 || pitch == 207) {
        2 *=> pitch;
    } else {
        2 /=> pitch;
    }
    pitch => pulse.freq;
    tempo => now;
}

function void continuous() {
    for (0 => int i; i < myPitch.cap(); i++) {
        myPitch[i] => pulse.freq;
        tempo_2 => now;
    }        
}

// MAIN PROGRAM 
continuous();
playMelody();
continuous();
