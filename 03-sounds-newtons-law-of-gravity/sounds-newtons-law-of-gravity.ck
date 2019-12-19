// Author: Elohim
// program name: sounds-newtons-law-of-gravity.ck

// pitch: 146-0, 164-1, 184-2, 207-3, 246-4, 261-5
// 293-6, 311-7, 329-8, 349-9
[146,164,184,207,246,261,293,311,329,349] @=> int myPitch[];
// Pattern to play the notes.
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

function void playMelody() {
    0 => int cicle;
    while (cicle < 2) {
        0 => int counter; 
        while (counter < pattern.cap()) {
            if (pattern[counter] == 0) {
                
            } else if (pattern[counter] == 1) {
                
            } else if (pattern[counter] == 2) {
                
            } else if (pattern[counter] == 3) {
                
            } else if (pattern[counter] == 4) {
                
            } else if (pattern[counter] == 5) {
                
            } else if (pattern[counter] == 6) {
                
            } else if (pattern[counter] == 7) {
                
            } else if (pattern[counter] == 8) {
                
            } else {
                
            }
            counter++;
            <<<counter>>>;
         }
         cicle++;
     }
}