// Author: Elohim
// program name: sounds-newtons-laws.ck
/*
* A short description of newton's laws:
*
* Force: An object remains in constant 
* movement until is moved by a force. 
* If is in repose remains in repose.
*
* Acceleration: Every force create and
* acceleration that is proportional to
* mass of a body. f = m*a 
*
* Action-Reaction: Every force is an 
* action that create an equal force 
* (reaction) that go in the opposite
* direction to the first force. 
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
 
0.3::second => dur tempo;
 
function void playSounds() {
    0 => int counter; 
    while (counter < pattern.cap()) {
        if (pattern[counter] == 0) {
            Std.mtof(notes[0]) => piano.freq;
        } else if (pattern[counter] == 1) {
            Std.mtof(notes[1]) => piano.freq;
        } else if (pattern[counter] == 2) {
            Std.mtof(notes[2]) => piano.freq;
        } else if (pattern[counter] == 3) {
            Std.mtof(notes[3]) => piano.freq;
        } else if (pattern[counter] == 4) {
            Std.mtof(notes[4]) => piano.freq;
        } else if (pattern[counter] == 5) {
            Std.mtof(notes[5]) => piano.freq;
        } else if (pattern[counter] == 6) {
            Std.mtof(notes[6]) => piano.freq;
        } else if (pattern[counter] == 7) {
            Std.mtof(notes[7]) => piano.freq;
        } else if (pattern[counter] == 8) {
            Std.mtof(notes[8]) => piano.freq;
        } else {
            Std.mtof(notes[9]) => piano.freq;
            
        }
        counter++;
        <<<counter>>>;
        
        0.5 => piano.gain;
        // Advance time
        1 => piano.noteOn;
        tempo => now;
        1 => piano.noteOff;
    }
    
}

// MAIN PROGRAM
playSounds();