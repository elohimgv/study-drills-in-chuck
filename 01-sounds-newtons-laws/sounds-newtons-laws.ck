// Author: Elohim
// program name: sounds-newtons-laws.ck
/*
* A short description of newton's laws:
*
* -Force: An object remains in constant movement until is moved by a force. If is in repose remains in repose.
*
* -Acceleration: Every force create and acceleration that is proportional to mass of a body. f = m*a 
*
* -Action-Reaction: Every force is an action that create an equal force (reaction) that go in the opposite
*  direction to the first force. 
*
* Reflection: If you revise my code below, explicity I not coded the newtons laws, but instead I reflect on that.
* First law: a note remains in constant movement until is moved by a force (maybe a finger). If the note is not
* playing remains in silence. ¿What it means constant movement? We live in a dual world, the movement go in 
* both directions... we can find movement in silence and movement in sound. 
*
* Second law: Every note played create an acceleration that is proportional to force of a finger. The mass
* of my complete body is much more than a simple piano key, for that it's have to play the key
* carefully. Use the force when is needed and not use the force just for feed your ego.
*
* Third law: Every act you commit generates a reaction with an equal force to the action that go in opposite 
* direction. How strong you push a piano key? It reacts with a sound when you play (action) a note. Be careful
* no to brake the key. 
*/ 

// Sound chain
Wurley piano => dac;

// notes: 50-0, 52-1, 54-2, 56-3, 59-4, 60-5
// 62-6, 63-7, 64-8, 65-9
[50, 52, 54, 56, 59, 60, 62, 63, 64, 65] @=> int notes[];
// Pattern to play the notes. I use the fibonacci sequence
[0,1,1,2,3,5,8,1,3,
 2,1,3,4,5,5,8,9,1,
 4,4,2,3,3,3,7,7,6,
 1,0,9,8,7,1,5,9,7,
 2,5,8,4,4,1,8,1,6,
 7,6,5,1,0,9,4,6,1,
 7,7,1,1,2,8,6,5,7,
 4,6,3,6,8] @=> int pattern[];

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
 
function void playNotes() {
    0 => int cicle;
    while (cicle < 2) {
        0 => int counter; 
        while (counter < pattern.cap()) {
            if (pattern[counter] == 0) {
                Std.mtof(notes[0]) => piano.freq;
                tempo(tempo_9);
            } else if (pattern[counter] == 1) {
                Std.mtof(notes[1]) => piano.freq;
                tempo(tempo_7);
            } else if (pattern[counter] == 2) {
                Std.mtof(notes[2]) => piano.freq;
                tempo(tempo_5);
            } else if (pattern[counter] == 3) {
                Std.mtof(notes[3]) => piano.freq;
                tempo(tempo_3);
            } else if (pattern[counter] == 4) {
                Std.mtof(notes[4]) => piano.freq;
                tempo(tempo_1); 
            } else if (pattern[counter] == 5) {
                Std.mtof(notes[5]) => piano.freq;
               tempo(tempo_2); 
            } else if (pattern[counter] == 6) {
                Std.mtof(notes[6]) => piano.freq;
                tempo(tempo_4);
            } else if (pattern[counter] == 7) {
                Std.mtof(notes[7]) => piano.freq;
                tempo(tempo_6);
            } else if (pattern[counter] == 8) {
                Std.mtof(notes[8]) => piano.freq;
                tempo(tempo_8);
            } else {
                Std.mtof(notes[9]) => piano.freq;
                tempo(tempo_9); 
            }
            counter++;
            <<<counter>>>;
            0.5 => piano.gain;
        }
        cicle++;
    }
}

function void tempo(dur t) {
    1 => piano.noteOn;
    t => now;
    1 => piano.noteOff;
}

// MAIN PROGRAM
playNotes();
